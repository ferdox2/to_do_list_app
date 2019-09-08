require 'sidekiq-scheduler'
class SendMailWorker
  include Sidekiq::Worker

  queue_as :mailer
  
  def perform
    users = User.all
    users.each do |user|
      mail = NotificationMailer.notification(user.id)
      mail.deliver
    end
  end
end
