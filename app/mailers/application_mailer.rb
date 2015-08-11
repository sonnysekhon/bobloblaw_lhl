class ApplicationMailer < ActionMailer::Base
  default from: "almanac.sender@gmail.com"
  layout 'mailer'
end
