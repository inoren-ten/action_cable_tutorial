class OtpMailerPreview < ActionMailer::Preview
    def welcome_email(user)
        OtpMailer.with(user: user).welcome_email
    end
end