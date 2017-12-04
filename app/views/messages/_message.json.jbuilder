json.extract! message, :id, :author, :content, :message_thread_id, :read, :created_at, :updated_at
json.url message_url(message, format: :json)
