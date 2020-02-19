require 'rails_helper'

RSpec.describe Participant, type: :model do
  before do
    # @game_room = FactoryBot.create(:game_room)
    # @search_current_user = FactoryBot.create(:search_current_user)
    @game_room = FactoryBot.create(:game_room)
    @user = FactoryBot.create(:user)
    @participant = FactoryBot.create(:owner, game_room_id: @game_room.id, participant_id: @user.id)
  end

  it 'game_room_idが入力されていないといけない' do
    @participant = Participant.new(
      game_room_id: 1,
      participant_id: 1,
      state: 1,
    )
    expect(@participant).not_to be_valid
  end

  it 'participant_idが入力されていないといけない' do
    @participant = Participant.new(
      game_room_id: 1,
      participant_id: 1,
      state: 1,
    )
    expect(@participant).not_to be_valid
  end

  it 'stateが入力されていないといけない' do
    @participant = Participant.new(
      game_room_id: 1,
      participant_id: 1,
      state: 1,
    )
    expect(@participant).not_to be_valid
  end

  it 'test'do
    @test = FactoryBot.create(:game_room)
  end


  it "search_current_user()でcurrent_userがゲームルームに所属するかどうかを調べる" do
  #   @search_current_user = FactoryBot.create(:search_current_user)
    expect(Participant.search_current_user(@user.id)).to include(@participant)
  end

end
