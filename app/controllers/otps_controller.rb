class OtpsController < ApplicationController
  def otp_check
    otp = Otp.find_by(email: params[:email], code: params[:code])
    if otp
      if Time.now <= otp.expired_at
        render status: 200, json: otp.email
      else
        render status: 422
      end
    else
      render status: 409
    end
  end

  def create
    otp = Otp.new(email: params[:email])
    otp.code = '%06d' % rand(10**6)
    otp.expired_at = Time.now + 30.minutes
    if otp.save
      OtpMailer.send_otp(otp.email).deliver_later

      render status: 200, json: otp
    else
      render status: 409
    end
  end
end
