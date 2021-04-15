class ReplyJob < ApplicationJob
  # Sends an email and saves the Message-Id to reference the thread

  attr_reader :post

  def perform(post)
    return if post.message_id? # Don't send email more than once
    @post = post

    mail = ConversationMailer.with(
      to: "noreply@example.com",
      reply_to: "conversation-#{conversation.id}@example.com",
      bcc: recipients.map{ |r| "#{r.name} <#{r.email}>" },
      post: post,
      conversation: conversation,
      in_reply_to: previous_message_ids.last, # Reply to the most recent message
      references: previous_message_ids, # Reference all the messages in the conversation
    ).new_post.deliver_now

    post.update(message_id: mail.message_id)
  end

  def conversation
    @conversation ||= post.conversation
  end

  def recipients
    @recipients ||= conversation.authors - [post.author]
  end

  def previous_message_ids
    @previous_message_ids ||= conversation.posts.where.not(id: post.id).pluck(:message_id).compact
  end
end
