FactoryBot.define do
  factory :playstation, class: GameMachine do
    game_device {0}
    device_id {"aaaaaaaaaaaaaaaaa"}
  end

  factory :nintendo, class: GameMachine do
    game_device {1}
    device_id {"Nintendo"}
  end

  factory :steam, class: GameMachine do
    game_device {2}

    device_id {"Steam"}
  end
  # factory :game_machine do
  #   game_device {2}
  #   device_id {"steam"}
  # end
end
