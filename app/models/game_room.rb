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

  enum play_device:{
    PlayStation: 0,
    Nintendo: 1,
    Steam: 2,
  }
  def user_not_owner(user)
    # binding.irb
    # Participant.find_by(game_room_id: gr.id, participant_id: current_user.id).blank?
    # self.participants.user_tied_game_room(self, user).blank?
    self.participants.find_by(stat:0).user_id == user.id
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
