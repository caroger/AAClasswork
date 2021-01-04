class ChangeUser < ActiveRecord::Migration[5.2]
  def change
    add_index(:users, [:name], unique: true)
    remove_column(:users, :email)
  end
end
