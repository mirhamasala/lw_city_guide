class AddStatusToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :status, :integer, default: 0
  end
end
