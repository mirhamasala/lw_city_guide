class AddCategoryToSpots < ActiveRecord::Migration[5.2]
  def change
    add_reference :spots, :category, foreign_key: true
  end
end
