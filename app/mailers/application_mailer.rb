class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name("anisphere.anime@gmail.com", "AniSphere")
  layout "mailer"
end
