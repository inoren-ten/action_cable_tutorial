class Room < ApplicationRecord
    has_many :room_users, dependent: :destroy
    has_many :users, through: :room_users

    has_many :chats

    private

    def self.create_room(room_name, users)
        room = Room.create(name: room_name)
        users.each do |user|
            user = User.find(user)
            room.users << user
        end
        room
    end
end
