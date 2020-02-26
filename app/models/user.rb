class User < ApplicationRecord

  before_create :ensure_has_name
  before_update :ensure_has_name

  acts_as_paranoid

  # devise
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :omniauthable, :confirmable

  # has_many :active_block, foreign_key: 'user_id', class_name: 'blacklist', dependent: :destroy
  # has_many :passive_block, foreign_key: 'block_user_id', class_name: 'blacklist', dependent: :destroy
  has_many :game_machines, dependent: :destroy
  has_many :participants, class_name: "Participant", foreign_key: "participant_id", dependent: :destroy
  has_many :game_rooms, through: :participants
  has_many :game_room_messages, dependent: :destroy, class_name: 'GameRoomMessage', foreign_key: 'write_user_id'
  has_many :message, dependent: :destroy
  has_many :chat_groups, dependent: :destroy

  accepts_nested_attributes_for :game_machines


  # devise facebook認証 自動ログイン
  def self.find_for_oauth(auth)
    user = User.find_by(uid: auth.uid, provider: auth.provider)

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
      game_machine = user.game_machines.build(game_device: "Nintendo", device_id: "")
      game_machine.save
      game_machine = user.game_machines.build(game_device: "PlayStation", device_id: "")
      game_machine.save
      game_machine = user.game_machines.build(game_device: "Steam", device_id: "")
      game_machine.save
    end
    user.skip_confirmation!
    user.save
    user
  end

  private

  def ensure_has_name
    self.name = '名無しさん' if name.blank?
  end

end
