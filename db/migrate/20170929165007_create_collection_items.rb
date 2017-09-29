class CreateCollectionItems < ActiveRecord::Migration[5.0]
  def change
    create_table :collection_items do |t|
      t.references :user, foreign_key: true
      t.references :collection, foreign_key: true
      t.string :file

      t.timestamps
    end
  end
end
