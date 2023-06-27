class OtpMailer < ApplicationMailer

    def send_otp(user)
        @user = user
        mail to: @user, subject: "【AniSphere】認証コードをお送りします。"
    end
end
