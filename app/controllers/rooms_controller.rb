class RoomsController < ApplicationController
  before_action :authenticate_user, {only: [:index, :create]}

  def index
    room_ids = RoomUser.where(user_id: @user.id)
    rooms = []
    room_ids.each do |room|
      rooms << Room.find(room.room_id)
    end

    render status: 200, json: rooms
  end

  def create
    members = params[:users].push(@user.id)
    room = Room.create_room(params[:name], members)

    render status: 200, json: room
  end

  def members
    user_ids = RoomUser.where(room_id: params[:room_id])
    users = []
    user_ids.each do |user|
      users << User.find(user.user_id)
    end
    user_datas = users.map do |user|
      user.attributes.except("email", "password_digest", "created_at", "updated_at")
    end

    render status:200, json: user_datas
  end
end
