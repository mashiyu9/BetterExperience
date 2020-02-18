FactoryBot.define do
  factory :game_room do
    id {1}
    game_title {"test_title"}
    start_time {"2029/12/10"}
    play_time {1}
    play_device {0}
    vc_possible {0}
    available_skype {0}
    available_discord {0}
    available_twitter {0}
    available_ingame_vc {0}
    open_twitter {0}
    room_name {"test_room_name"}
    end
end
