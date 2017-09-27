class Company < ApplicationRecord
  has_many :users
  mount_uploader :logo, LogoUploader
end
