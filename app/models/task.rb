class Task < ApplicationRecord
  belongs_to :user
  belongs_to :company
  belongs_to :proposal
end
