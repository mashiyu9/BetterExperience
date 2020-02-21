FactoryBot.define do
  factory :owner, class: Participant do
    participant_id {user.id}
    game_room_id {game_room.id}
    state {0}
  end

  factory :participant do
    state {2}
  end
end
