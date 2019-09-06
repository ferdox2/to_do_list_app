require 'sidekiq-scheduler'
class SendMailWorker
  include Sidekiq::Worker

  def perform
    users = User.all
    users.each do |user|
      mail = NotificationMailer.notification(user.id)
      mail.deliver_now
    end
  end
end
