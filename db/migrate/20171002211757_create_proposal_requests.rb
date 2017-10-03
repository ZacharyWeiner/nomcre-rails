class CreateProposalRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :proposal_requests do |t|
      t.bigint :requested_by
      t.bigint :requested
      t.boolean :accepted
      t.boolean :approved
      t.references :proposal, foreign_key: true

      t.timestamps
    end
  end
end
