class AddNotesToScheduleItem < ActiveRecord::Migration[5.0]
  def change
    add_column :schedule_items, :notes, :text
  end
end
