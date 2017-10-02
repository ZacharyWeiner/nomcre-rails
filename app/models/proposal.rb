class Proposal < ApplicationRecord
  belongs_to :company
  belongs_to :user, optional: true
  has_many :tasks
  paginates_per 20
  mount_uploader :model_release, FileUploader

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
