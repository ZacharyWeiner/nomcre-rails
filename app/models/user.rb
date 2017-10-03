class User < ApplicationRecord
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  validates :name, presence: true
  validates :email, uniqueness: true, email: true
  belongs_to :company, optional: true
  accepts_nested_attributes_for :company
  has_many :schedule_items
  has_many :collections
  has_many :collection_items
  has_many :proposal_requests
  has_many :tasks
  has_many :messages
  has_many :chatrooms, through: :messages
  has_many :notifications
  mount_uploader :profile_image, ImageUploader

  def set_default_role
    self.role ||= :user
  end

  def has_request(proposal_id)
    ProposalRequest.where(requested: self.id, proposal_id: proposal_id).count > 0
  end

  def get_proposal_request(proposal_id)
    ProposalRequest.where(requested: self.id, proposal_id: proposal_id).first
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
