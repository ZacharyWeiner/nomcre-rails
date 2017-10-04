class Message < ApplicationRecord

  belongs_to :user
  belongs_to :chatroom
  mount_uploader :file, FileUploader
  after_create_commit { MessageBroadcastJob.perform_later self }

end
