class User < ApplicationRecord

  has_many :active_block, foreign_key: 'user_id', class_name: 'blacklist', dependent: :destroy
  has_many :passive_block, foreign_key: 'block_user_id', class_name: 'blacklist', dependent: :destroy
  has_many :game_machines, dependent: :destroy
  has_many :message, dependent: :destroy
  has_many :chat_groups, dependent: :destroy

  accepts_nested_attributes_for :game_machines

end
