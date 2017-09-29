class CollectionItem < ApplicationRecord
  belongs_to :user
  belongs_to :collection

  mount_uploader :file, FileUploader
end
