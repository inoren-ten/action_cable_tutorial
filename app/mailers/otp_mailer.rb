class OtpMailer < ApplicationMailer

    def send_otp(user)
        @user = user
        mail to: @user, subject: "認証コードをお送りします。"
    end
end
