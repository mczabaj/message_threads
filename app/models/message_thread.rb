class MessageThread < ApplicationRecord
  belongs_to :user
  has_many :messages

  def unread
    self.messages.where(read: false).count
  end

  def mark_read
    self.messages.each do |message|
      message.read = true
      message.save
    end
  end
end
