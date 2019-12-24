class RemoveGithubHandleFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :github_handle
  end
end
