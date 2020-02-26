require 'rails_helper'

RSpec.describe 'systemspec', type: :system do
  let(:user){FactoryBot.create(:user)}

  let(:game_room){FactoryBot.create(:game_room)}
  let(:playstation){FactoryBot.create(:playstation, user: user)}
  let(:nintendo){FactoryBot.create(:nintendo, user: user)}
  let(:steam){FactoryBot.create(:steam, user: user)}
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'commit'
  end

  describe 'ログイン,ログアウト機能まわり' do
    context 'ログインしていないのにゲームルーム一覧に飛ぼうとした時' do
      it 'ログイン画面に飛ぶ' do
        click_on 'ログアウト'
        sleep 1
        visit new_user_session_path
        expect(page).to have_content 'ログインを記憶'
      end
    end

    context 'ログイン状態でログイン画面に行こうとしたとき' do
      it 'ゲームルーム一覧画面に戻される' do
        visit new_user_session_path
        expect(page).to have_content 'すでにログインしています'
      end
    end
  end
  describe '募集開始ページ' do
    it 'ユーザーが募集をすることができる' do
      visit new_game_room_path
      fill_in 'game_room[game_title]', with: "game_title"
      num = Time.now + 100
      fill_in 'game_room[start_time]', with: num
      click_on 'commit'
      expect(page).to have_content "game_title"
    end
  end

  describe '募集一覧ページ' do
    before do
      visit new_game_room_path
      fill_in 'game_room[game_title]', with: "game_title"
      num = Time.now + 100
      fill_in 'game_room[start_time]', with: num
      click_on 'commit'
    end
    it '詳細ページを押したときに募集の詳細に飛ぶことができる' do
      playstation
      steam
      nintendo
      click_on '詳細ページへ'
      expect(page).to have_content "募集詳細ページ"
    end
    it '参加希望を押したときに参加を申請できる' do
      @user2 = FactoryBot.create(:user2)
      @playstation = FactoryBot.create(:playstation, user: @user2)
      @nintendo = FactoryBot.create(:nintendo, user: @user2)
      @steam = FactoryBot.create(:steam, user: @user2)
      click_on 'ログアウト'
      sleep 2
      fill_in 'user[email]', with: @user2.email
      fill_in 'user[password]', with: @user2.password
      click_on 'commit'
      click_on '参加希望'
      expect(page).to have_content "参加を希望しました！"
    end

    it 'タグをクリックすると検索フォームに入る' do
      click_on 'ApexLegends'
      expect(page).to have_field name="q[game_title_cont]", with: 'ApexLegends'
      click_on 'FF14'
      expect(page).to have_field name="q[game_title_cont]", with: 'FF14'
      click_on 'PUBG'
      expect(page).to have_field name="q[game_title_cont]", with: 'PUBG'
    end

    it 'vcを利用するをクリックすると細かい条件を入力できる' do
      choose 'vc_possible_index'
      expect(page).to have_content "スカイプを利用する"
    end
  describe '募集詳細ページ' do
    before do
      playstation
      nintendo
      steam
      click_on '詳細ページへ'
    end
    it '募集主だと部屋の情報を更新できる' do
      expect(page).to have_content "部屋の条件を編集する"
    end
    it 'メッセージを送ることができる' do
      fill_in 'game_room_message[body]', with: "comenttest"
      click_on 'メッセージを送る'
      expect(page).to have_content "comenttest"
    end
  end
  end
end
