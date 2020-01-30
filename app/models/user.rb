class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable

  has_many :active_block, foreign_key: 'user_id', class_name: 'blacklist', dependent: :destroy
  has_many :passive_block, foreign_key: 'block_user_id', class_name: 'blacklist', dependent: :destroy
  has_many :game_machines, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :message, dependent: :destroy
  has_many :chat_groups, dependent: :destroy

  accepts_nested_attributes_for :game_machines


  # device facebook認証 自動ログイン
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end
    user.skip_confirmation!
    user.save
    user
  end

end
