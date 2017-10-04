class AddProposalIdToChatrooms < ActiveRecord::Migration[5.0]
  def change
    add_reference :chatrooms, :proposal, foreign_key: true
  end
end
