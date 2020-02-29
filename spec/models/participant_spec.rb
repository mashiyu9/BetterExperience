require 'rails_helper'

RSpec.describe Participant, type: :model do
  before do
    @owner = FactoryBot.create(:owner, game_room_id: game_room.id, user_id: user.id)
  end
  let(:game_room) {FactoryBot.create(:game_room)}
  let(:user) {FactoryBot.create(:user)}
  let(:participant) {FactoryBot.create(:participant, game_room_id: game_room.id, user_id: user.id)}

  it 'game_room_idが入力されていないといけない' do
    @participant_user = Participant.new(
      game_room_id: 1,
      user_id: 1,
      state: 1,
    )
    expect(@participant_user).not_to be_valid
  end

  it 'participant_idが入力されていないといけない' do
    @participant_user = Participant.new(
      game_room_id: 1,
      user_id: 1,
      state: 1,
    )
    expect(@participant_user).not_to be_valid
  end

  it 'stateが入力されていないといけない' do
    @participant_user = Participant.new(
      game_room_id: 1,
      user_id: 1,
      state: 1,
    )
    expect(@participant_user).not_to be_valid
  end

  it "search_current_user()でcurrent_userがゲームルームに所属するかどうかを調べる" do
    expect(Participant.search_current_user(user.id)).to include(participant)
  end

  it "ownerがscopeが参加者の中からstateが0のものを持ってくるか調べる" do
    expect(Participant.owner).to eq @owner
  end

end
