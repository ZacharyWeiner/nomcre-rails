class AddLocationsToScheduleItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :schedule_items, :location, foreign_key: true
  end
end
