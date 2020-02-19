FactoryBot.define do
  factory :owner, class: Participant do
    state {0}
  end

  factory :participant do
    state {2}
  end
end
