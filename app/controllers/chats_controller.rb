class ChatsController < ApplicationController
  before_action :authenticate_user, {only: [:create]}

  def index
    chats = Chat.where(room_id: params[:room_id])

    render status: 200, json: chats
  end

  def create
    chat = Chat.new(user_id: @user.id, room_id: params[:room_id], body: params[:body])
    if chat.save
      render status: 200, json: chat
      ActionCable.server.broadcast("chat_#{chat.room_id}", chat)
    else
      render status: 409, json: "save error"
    end
  end
end
