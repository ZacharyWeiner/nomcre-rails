class Notifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.string :notification_type
      t.bigint :notification_obeject_id
      t.boolean :read, default: false
      t.timestamps
    end
  end
end
