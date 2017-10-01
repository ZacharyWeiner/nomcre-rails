class AddDepositInfoToProposals < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :deposit_id, :string
    add_column :proposals, :deposit_paid, :boolean
    add_column :proposals, :deposit_paid_on, :date
  end
end
