class GameRoomMailer < ApplicationMailer
  def request_mail(current_user, owner_user)
    @current_user = current_user
    @owner_user = owner_user
    mail to: @owner_user.user.email, subject: "あなたの募集に参加を希望する人がいます!"
  end

  def approval_mail(user, room)
    @user = user
    @room = room

    mail to: @user.email, subject: "参加要望が承認されました"
  end
end
