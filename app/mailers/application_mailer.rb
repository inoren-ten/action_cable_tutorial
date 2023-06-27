class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name("", "")
  layout "mailer"
end
