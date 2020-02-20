require 'rails_helper'

RSpec.describe 'systemspec', type: :system do
  let(:user){FactoryBot.create(:user)}
  let(:game_room){FactoryBot.create(:game_room)}
  let(:playstation){FactoryBot.create(:playstation, user: user)}
  let(:nintendo){FactoryBot.create(:nintendo, user: user)}
  let(:steam){FactoryBot.create(:steam, user: user)}
  # let(:participant){FactoryBot.create(:owner)}
  # shop = FactoryBot.build(:shop) do |s|
  #   s.staffs.build(FactoryBot.attributes_for(:staff))
  # end
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'commit'
    # @user = create(:user, password: "password")
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
      fill_in 'game_room[start_time]', with: "2033-02-20T03:33"
      click_on 'commit'
      expect(page).to have_content "game_title"
    end
  end

  describe '募集一覧ページ' do
    before do
      visit new_game_room_path
      fill_in 'game_room[game_title]', with: "game_title"
      fill_in 'game_room[start_time]', with: "2033-02-20T03:33"
      click_on 'commit'
    end
    it '詳細ページを押したときに募集の詳細に飛ぶことができる' do
      # FactoryBot.create(:participant, participant_id: user.id, game_room_id: game_room.id)
      playstation
      steam
      nintendo
      click_on '詳細ページへ'
      expect(page).to have_content "募集詳細ページ"
    end
  end
  #   it '詳細ページを押したときに募集の詳細に飛ぶことができる' do
  #     binding.irb
  #     visit game_rooms_path
  #     visit game_room_path(10)
  #     # click_on '詳細ページへ'
  #     expect(page).to have_content "募集詳細ページ"
  #   end
  # end

  #     it 'ユーザーを削除することができる' do
  #       user2 = create(:user, password: "password")
  #       visit admin_users_path
  #       num = User.all.count - 1
  #       all('tbody td')[6].click_link '削除'
  #       page.driver.browser.switch_to.alert.accept
  #       sleep 1
  #       expect(User.all.count).to eq num
  #     end

  #     it 'ユーザーを更新することができる' do
  #       visit admin_users_path
  #       all('tbody td')[5].click_link '編集'
  #       fill_in 'user[name]', with: "testですよ"
  #       fill_in 'user[email]', with: "test@gmail.com"
  #       fill_in 'user[password]', with: 'password'
  #       fill_in 'user[password_confirmation]', with: 'password'
  #       click_button 'commit'
  #       expect(page).to have_content "testですよ"



  #     end
  #   end

  #   context '管理者画面から詳細ユーザーの詳細画面に飛んだ時' do
  #     it 'そのユーザーの作成したタスクも表示される' do
  #       visit admin_user_path(@user)
  #       expect(page).to have_content @task1.content
  #     end
  #   end


  # end


  # describe 'タスク一覧画面' do

  #   before do
  #     visit new_session_path
  #     fill_in 'session[email]', with: @user.email
  #     fill_in 'session[password]', with: 'password'
  #     click_on 'commit'
  #   end

  #   context 'タスクを作成した場合' do
  #     it '作成済みのタスクが表示されること' do
  #       visit tasks_path
  #       expect(page).to have_content 'fugafuga'
  #     end

  #     it '複数のラベルをタスクにつけられること' do
  #       visit new_task_path
  #       fill_in 'task[title]', with: 'testtitle'
  #       fill_in 'task[content]', with: 'test'
  #       select '高', from: 'task[importance]'
  #       select '完了', from: 'task[status]'
  #       # check "testlabel1"
  #       check "task_label_ids_#{@test_label1.id}"
  #       check "task_label_ids_#{@test_label2.id}"

  #       # check "#test_label_ids_" + "#{@test_label2.id}"
  #       click_button '登録する'

  #       expect(page).to have_content @test_label1.series
  #       expect(page).to have_content @test_label2.series
  #     end

  #   end

  #   context 'タスク一覧画面に遷移した時' do
  #     it '作成日時の降順でタスクが表記される' do
  #       visit tasks_path
  #       tasks = all('.task_list_parts')
  #       expect(tasks[0]).to have_content "aaa"
  #       expect(tasks[1]).to have_content "fugafuga"
  #       expect(tasks[2]).to have_content "hellow world"

  #     end

  #   end

  #   context '重要度ボタンを押した時' do
  #     it '重要度が高い順にソートされる' do
  #       visit tasks_path
  #       click_on '優先度'
  #       sleep 2
  #       all('tbody td')[5].click_link '詳細'
  #       sleep 2
  #       expect(page).to have_content "高"
  #     end
  #   end

  #   context '終了期限順ボタンを押したとき' do
  #     it '期限が近い順にソートされる' do
  #       visit tasks_path
  #       tasks = all('.task_list_parts')
  #       expect(tasks[0]).to have_content "tanaka"
  #     end
  #   end

  # end

  # describe 'タスク登録画面' do
  #   before do
  #     visit new_session_path
  #     fill_in 'session[email]', with: @user.email
  #     fill_in 'session[password]', with: 'password'
  #     click_on 'commit'
  #   end

  #   context '必要項目を入力して、createボタンを押した場合' do
  #     it 'データが保存されること' do
  #       visit new_task_path
  #       fill_in 'task[title]', with: 'テストタイトルffffffffffff'
  #       fill_in 'task[content]', with: 'テストコンテンツ'
  #       select '高', from: 'task[importance]'
  #       select '完了', from: 'task[status]'
  #       click_button '登録する'
  #       visit tasks_path
  #       expect(page).to have_content '高'
  #     end
  #   end
  # end

  # describe 'タスク編集画面' do
  #   before do
  #     visit new_session_path
  #     fill_in 'session[email]', with: @user.email
  #     fill_in 'session[password]', with: 'password'
  #     click_on 'commit'
  #   end
  #   context 'タスクを編集する時' do
  #     it 'ラベルも一緒に編集できること' do
  #       visit edit_task_path(@task1)
  #       check "task_label_ids_#{@test_label1.id}"
  #       check "task_label_ids_#{@test_label3.id}"
  #       click_button '更新する'
  #       expect(page).to have_content @test_label1.series, @test_label3.series
  #     end
  #   end
  # end

  # describe 'ラベル作成画面' do
  #   before do
  #     visit new_session_path
  #     fill_in 'session[email]', with: @user.email
  #     fill_in 'session[password]', with: 'password'
  #     click_on 'commit'
  #   end

  #   context 'ユーザーが任意のラベルを作成した時' do
  #     it '自分が作ったラベルしか使えないように' do
  #       visit new_task_path
  #       expect(page).not_to have_content @user2.labels
  #     end
  #   end
  # end

  # describe 'タスク詳細画面' do
  #   context '任意のタスク詳細画面に遷移した場合' do
  #     it '該当タスクの内容が表示されたページに遷移すること' do

  #       visit task_path(@task1)
  #       expect(page).to have_content 'hellow world'
  #     end
  #   end
  # end
end
