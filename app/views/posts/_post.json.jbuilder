json.extract! post, :id, :conversation_id, :contact_id, :body, :attachments, :created_at, :updated_at
json.url post_url(post, format: :json)
json.body post.body.to_s
json.attachments do
  json.array!(post.attachments) do |attachment|
    json.id attachment.id
    json.url url_for(attachment)
  end
end
