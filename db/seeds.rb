
20.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  skype_id = "#{name}のスカイプID"
  discord_id = "#{name}のディスコードID"
  twitter_address = "#{name}のtwitterアカウント"
  User.create!(name:name,
          email:email,
          password:password,
          password_confirmation:password,
          skype_id:skype_id,
          discord_id: discord_id,
          twitter_address: twitter_address,)
end
20.times do |n|
  num = n + 1
  GameMachine.create!(
    user_id:num,
    game_device:0,
    device_id:Faker::App.name,)
end
20.times do |n|
  num = n + 1
  GameMachine.create!(
    user_id:num,
    game_device:1,
    device_id:Faker::App.name,)
end
20.times do |n|
  num = n + 1
  GameMachine.create!(
    user_id:num,
    game_device:2,
    device_id:Faker::App.name,)
end

20.times do |n|
  game_title = Faker::Game.title
  comment = Faker::Game.genre
  time = Faker::Time.forward(days: 23, period: :morning)
  GameRoom.create!(
          game_title:game_title,
          available_skype:Faker::Boolean.boolean(true_ratio: 0.5),
          available_discord:Faker::Boolean.boolean(true_ratio: 0.5),
          available_twitter:Faker::Boolean.boolean(true_ratio: 0.5),
          comment:comment,
          vc_possible:true,
          play_time:1,
          play_device:rand(3),
          start_time:time,)
end

20.times do |n|
  num = n + 1
  Participant.create!(
    game_room_id:num,
    participant_id:num,
    state:0,
  )
end
# GameRoom.all.each do |gr|
#   if tweet.user_id != user_id && rand(4) == 0
#     favorites_list << { user_id: user_id, tweet_id: tweet.id }
#   end
# end






