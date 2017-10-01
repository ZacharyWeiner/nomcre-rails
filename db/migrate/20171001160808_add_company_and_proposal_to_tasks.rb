class AddCompanyAndProposalToTasks < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :company, foreign_key: true
    add_reference :tasks, :proposal, foreign_key: true
  end
end
