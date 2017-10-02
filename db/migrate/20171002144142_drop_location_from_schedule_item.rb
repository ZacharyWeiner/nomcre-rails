class DropLocationFromScheduleItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :schedule_items, :location
  end
end
