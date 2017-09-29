class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.date :deadline
      t.boolean :completed

      t.timestamps
    end
  end
end
