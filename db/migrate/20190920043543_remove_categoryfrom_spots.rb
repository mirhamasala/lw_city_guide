class RemoveCategoryfromSpots < ActiveRecord::Migration[5.2]
  def change
    remove_column :spots, :category, :string
  end
end
