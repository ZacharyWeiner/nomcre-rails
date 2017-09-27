class CreateWaitlists < ActiveRecord::Migration[5.0]
  def change
    create_table :waitlists do |t|
      t.string :name
      t.string :email
      t.string :instragram
      t.string :px500
      t.string :facebook
      t.string :phone
      t.string :website
      t.string :smugmug

      t.timestamps
    end
  end
end
