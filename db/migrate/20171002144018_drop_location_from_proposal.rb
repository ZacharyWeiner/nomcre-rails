class DropLocationFromProposal < ActiveRecord::Migration[5.0]
  def change
    remove_column :proposals, :location
  end
end
