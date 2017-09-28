class CreateScheduleItems < ActiveRecord::Migration[5.0]
  def change
    create_table :schedule_items do |t|
      t.date :start_date
      t.date :end_date
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
