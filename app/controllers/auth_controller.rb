class AuthController < ApplicationController
  def login
    user = User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password]) 
        user_data = user.attributes.except("email", "password_digest")
        payload = {user_id: user.id, email: user.email}
        token = encode_token(payload)
        render json: {user: user_data, jwt: token}
      else
        render status: 401, json: "パスワードが間違っています"
      end
    else
      render status: 401, json: "このメールアドレスのユーザーは存在しません"
    end
  end

  def check
    requests = []
      request.headers.each do |header, value|
          requests << "#{header}: #{value}"
      end
    render json: requests
  end

  def auto_login
    if session_user
      render json: session_user
    else
      render json: {errors: "No user Logged In"}
    end
  end
end
