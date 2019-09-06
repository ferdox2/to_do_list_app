class ApplicationMailer < ActionMailer::Base
  default from: '@heroku.com'
  layout 'mailer'
end
