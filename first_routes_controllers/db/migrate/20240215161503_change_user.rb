class ChangeUser < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :name, :username
    remove_column :users, :email
  end
end
