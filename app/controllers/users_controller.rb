class UsersController < ApplicationController
  def index
    users = User.all
    user_datas = users.map do |user|
      user.attributes.except("email", "password_digest", "created_at", "updated_at")
    end

    render status: 200, json: user_datas
  end

  def create
    user = User.new(name: params[:name], email: params[:email], password: params[:password])

    if User.find_by(email: params[:email])
      render status: 422, json: "既に存在するアカウントです"
    else
      user.uid = "@" + generate_random_uid
      if user.save
        user_data = user.attributes.except("email", "password_digest")
        payload = {user_id: user.id}
        token = encode_token(payload)
        render status: 200, json: {user: user_data, jwt: token}
      else
        render status: 409, json: {error: user.errors.full_message}
      end
    end
  end

  private

  def generate_random_uid
    loop do
        random_string = SecureRandom.urlsafe_base64(12)
        break random_string unless User.exists?(uid: random_string)
    end
  end
end
