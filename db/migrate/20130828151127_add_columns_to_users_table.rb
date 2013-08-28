class AddColumnsToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :avatar, :string
    add_column :users, :role, :string
    remove_column :users, :password_digest
  end
end
