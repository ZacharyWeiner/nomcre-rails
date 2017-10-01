class ChatroomsController < ApplicationController
  layout 'chatroom'
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    notifications = Notification.where(user: current_user, notification_type: "New Message", notification_obeject_id: params[:id], read:false)
    notifications.each do |note|
      note.read = true
      note.save
    end
  end
end
