json.extract! conversation, :id, :subject, :created_at, :updated_at
json.url conversation_url(conversation, format: :json)
