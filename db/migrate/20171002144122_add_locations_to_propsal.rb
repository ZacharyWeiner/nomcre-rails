class AddLocationsToPropsal < ActiveRecord::Migration[5.0]
  def change
    add_reference :proposals, :location, foreign_key: true
  end
end
