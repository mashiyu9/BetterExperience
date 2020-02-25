# User.seed do |s|
#   s.id = 1
#   s.name = 'テスト１号'
#   s.email = 'hogehoge@email.com'
#   s.profile = 'よろしくお願いします'
#   s.password = 'password'
#   s.password_confirmation = 'password'
#   s.twitter_address = 'password'
#   s.skype_id = 'テスト１号skypeid'
#   s.discord_id = 'テスト１号discordid'
# end

50.times do
  User.create(
    name: Faker::DragonBall.character,
    email: Faker::Internet.email,
    profile: Faker::Movies::Ghostbusters.character,
    password: 'password',
    password_confirmation: 'password',
    twitter_address: Faker::Internet.email,
    skype_id: Faker::Coffee.variety,
    discord_id: Faker::Games::Pokemon.name,
  )
end