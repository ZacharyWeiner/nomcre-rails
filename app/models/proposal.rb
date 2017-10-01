class Proposal < ApplicationRecord
  belongs_to :company
  belongs_to :user, optional: true
  paginates_per 20
end
