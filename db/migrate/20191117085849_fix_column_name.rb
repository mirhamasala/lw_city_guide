class FixColumnName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :github_handle, :github_username
  end
end
