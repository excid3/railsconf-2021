class ConversationMailer < ApplicationMailer
  before_action do
    @conversation = params[:post].conversation
  end

  def new_post
    headers["In-Reply-To"] = params[:in_reply_to]
    headers["References"] = params[:references]

    mail(to: params[:to], bcc: params[:bcc])
  end
end
