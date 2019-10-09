class RemoveUserFromSpots < ActiveRecord::Migration[5.2]
  def change
    remove_column :spots, :user_id
  end
end
