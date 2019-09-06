class NotificationMailer < ApplicationMailer

  def notification(user_id)
    @user = User.find(user_id)
    mail(to: user.email,
         subject: 'Weekly report' )
  end
end
