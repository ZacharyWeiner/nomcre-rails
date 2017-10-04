class Proposal < ApplicationRecord
  belongs_to :company
  belongs_to :user, optional: true
  belongs_to :location
  has_many :tasks
  has_many :proposal_requests
  has_one :chatroom
  paginates_per 20
  mount_uploader :model_release, FileUploader

  def find_creatives
    creatives =[]
    search_date = Date.today
    creatives = ScheduleItem.where(location: self.location).where("end_date > ?", search_date).map{|si|
      ProposalSearchResult.new(user_id: si.user.id, rank: 3, schedule_item_id: si.id)
    }
    unless self.location.parent_id.nil?
      ScheduleItem.where(location_id: self.location.parent_id).where("end_date > ?", search_date).map{|si|
        creatives << ProposalSearchResult.new(user_id: si.user.id, rank: 2, schedule_item_id: si.id)
      }
    end
    return creatives.sort! { |a, b|  b.rank <=> a.rank }
  end

  def create_tasks
    if self.proposal_type = "Photo"
      self.tasks.create!(company: self.company, description: "Photo Task 1", deadline: self.deadline, completed: false)
      self.tasks.create!(company: self.company, description: "Photo Task 2", deadline: self.deadline, completed: false)
      self.tasks.create!(company: self.company, description: "Photo Task 3", deadline: self.deadline, completed: false)
      self.tasks.create!(company: self.company, description: "Photo Task 4", deadline: self.deadline, completed: false)
    elsif self.proposal_type == "Video"
      self.tasks.create!(company: self.company, description: "Video Task 1", deadline: self.deadline, completed: false)
      self.tasks.create!(company: self.company, description: "Video Task 1", deadline: self.deadline, completed: false)
      self.tasks.create!(company: self.company, description: "Video Task 1", deadline: self.deadline, completed: false)
      self.tasks.create!(company: self.company, description: "Video Task 1", deadline: self.deadline, completed: false)
    elsif self.proposal_type == "Drone"
      self.tasks.create!(company: self.company, description: "Drone Task 1", deadline: self.deadline, completed: false)
      self.tasks.create!(company: self.company, description: "Drone Task 1", deadline: self.deadline, completed: false)
      self.tasks.create!(company: self.company, description: "Drone Task 1", deadline: self.deadline, completed: false)
      self.tasks.create!(company: self.company, description: "Drone Task 1", deadline: self.deadline, completed: false)
    end
  end
end
