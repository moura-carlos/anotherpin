class ApplicationMailer < ActionMailer::Base
  default from: 'carlos@example.com' # or use -> carlos@anotherpin.co
  layout 'mailer'
end
