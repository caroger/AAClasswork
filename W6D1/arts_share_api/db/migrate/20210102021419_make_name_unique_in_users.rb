class MakeNameUniqueInUsers < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :name
    change_column :users, :name, :string, unique: true
  end
end
