class ChatGroup < ApplicationRecord
  belongs_to :chat_room
  belongs_to :user
end
