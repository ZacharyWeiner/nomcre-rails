class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.references :user, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
