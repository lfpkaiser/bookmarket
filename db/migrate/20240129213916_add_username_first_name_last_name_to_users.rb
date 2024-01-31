class AddUsernameFirstNameLastNameToUsers < ActiveRecord::Migration[7.1]
  def change
    # add columns username, first_name and last_name to users table
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
