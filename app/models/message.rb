class Message < ApplicationRecord
  include AutoHtml
  belongs_to :user
  belongs_to :chatroom
  mount_uploader :file, FileUploader
  after_create_commit { MessageBroadcastJob.perform_later self }

  auto_html_for :content do
    html_escape
    image
    youtube(:width => 400, :height => 250, :autoplay => true)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
end
