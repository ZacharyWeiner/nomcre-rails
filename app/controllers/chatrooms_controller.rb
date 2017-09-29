class ChatroomsController < ApplicationController
  layout 'chatroom'
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
