json.extract! message, :id, :author, :content, :message_thread_id, :read, :created_at, :updated_at
json.url message_thread_message_url(message_thread_id: message.message_thread_id, id: message.id, format: :json)
