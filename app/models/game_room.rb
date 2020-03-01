class GameRoom < ApplicationRecord

  require "date"

  has_many :participants, dependent: :destroy
  has_many :game_room_messages, dependent: :destroy
  has_many :users, through: :participants

  validates :game_title, presence: true
  validates :start_time, presence: true
  validates :play_time, presence: true
  validates :play_device, presence: true
  validates :room_name, presence: true
  validate :date_not_before_today
  validate :date_not_after_one_year_later

  scope :valid_time_room, -> {where('start_time >= ?', Date.today)}

  enum play_device:{
    PlayStation: 0,
    Nintendo: 1,
    Steam: 2,
  }

  def self.search_owner_info(game_room_id)
    self.find(game_room_id).participants.owner
  end

  def user_exists?(current_user_id)
    # scope :search_current_user, -> (current_user) {find_by(user_id: current_user)}
    self.participants.search_current_user(current_user_id).present?
  end

  def user_not_owner?(user)
    self.participants.owner.user_id != user.id
  end

  def date_not_before_today
    errors.add(:start_time, "は今日以降のものを選択してください") if start_time.nil? || start_time < Date.today
  end

  def date_not_after_one_year_later
    day = Date.today
    one_year_later = day.next_year(1)
    errors.add(:start_time, "は一年以内を選択してください") if start_time.nil? || start_time > one_year_later
  end

end
