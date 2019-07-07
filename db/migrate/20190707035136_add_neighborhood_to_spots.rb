class AddNeighborhoodToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :neighborhood, :string
  end
end
