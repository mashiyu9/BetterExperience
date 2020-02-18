FactoryBot.define do
  factory :search_current_user, class: Participant do
    game_room {1}
    participant_id {1}
    state {0}
    association :game_room, :factory => :game_room
  end
end
