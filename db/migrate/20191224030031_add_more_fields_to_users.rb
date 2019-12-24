class AddMoreFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :avatar, :string
    add_column :users, :bio, :string
    add_column :users, :location, :string
    add_column :users, :github_profile, :string
  end
end
