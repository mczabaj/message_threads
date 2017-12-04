class User < ApplicationRecord
  has_one :message_thread
end
