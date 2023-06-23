class ApplicationController < ActionController::API

    before_action :session_user
    
    def encode_token(payload)
        JWT.encode(payload, 'my_secret_key', 'HS256')
    end

    def session_user
        decoded_hash = decoded_token
        if decoded_hash
            if !decoded_hash.empty?
                user_id = decoded_hash[0]['user_id']
                @user = User.find_by(id: user_id)
            else
                nil
            end
        else
            nil
        end
    end


    def decoded_token
        pattern = /^Bearer /
        header = request.headers['authorization']

        if header
            token = header.gsub(pattern, '') 
            begin
                JWT.decode(token, 'my_secret_key', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                []
            end
        end
    end

    def authenticate_user
        unless @user
            render status: 409, json: "ログインしてください"
        end
    end
end
