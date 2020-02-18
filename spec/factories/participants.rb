FactoryBot.define do
  factory :search_current_user, class: Participant do
    game_room_id {1}
    participant_id {1}
    status {0}
  end
  factory :participant do
    game_room_id {0}
  end

end
