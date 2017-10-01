class AddFileToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :file, :text
  end
end
