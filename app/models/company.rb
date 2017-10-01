class Company < ApplicationRecord
  has_many :users
  has_many :tasks
  mount_uploader :logo, LogoUploader
end
