require 'rails_helper'

RSpec.describe Participant, type: :model do
  # before do
    # @search_current_user = create(:search_current_user)
    # FactoryBot.create(:game_room)
    # @search_current_user = FactoryBot.create(:search_current_user)
  before do
    @game_room = FactoryBot.create(:game_room)
    @search_current_user = FactoryBot.create(:search_current_user)
  end
  # before do
  #   let(:game_room){
  #     FactoryGirl.create(
  #       :search_current_user,
  # ) }
  #   let(:search_current_user) {
  #     FactoryGirl.create(
  #       :search_current_user,
  #     )
  #   }
  # end

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

  it "search_current_user()でcurrent_userがゲームルームに所属するかどうかを調べる" do
    @search_current_user = FactoryBot.create(:search_current_user)
    expect(Participant.search_current_user(1)).to include(@search_current_user)
  end

end
