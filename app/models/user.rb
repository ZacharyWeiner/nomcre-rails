class User < ApplicationRecord
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  validates :name, presence: true
  validates :email, uniqueness: true, email: true
  belongs_to :company, optional: true
  accepts_nested_attributes_for :company
  has_many :schedule_items
  has_many :tasks
  mount_uploader :profile_image, ImageUploader

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
