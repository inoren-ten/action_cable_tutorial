class User < ApplicationRecord

    has_secure_password

    has_many :room_users, dependent: :destroy
    has_many :rooms, through: :room_users

    has_many :chats

    validates :name, {presence: true}
    validates :email, {presence: true, uniqueness: true}
    validates :password_digest, {presence: true}
    validates :uid, {presence: true, uniqueness: true}
end
