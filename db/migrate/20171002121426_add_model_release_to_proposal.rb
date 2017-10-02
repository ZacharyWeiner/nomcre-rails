class AddModelReleaseToProposal < ActiveRecord::Migration[5.0]
  def change
    add_column :proposals, :model_release, :text
  end
end
