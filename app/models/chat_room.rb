class ChatRoom < ApplicationRecord
  has_many :chat_group, dependent: :destroy
  has_many :messages, dependent: :destroy
end
