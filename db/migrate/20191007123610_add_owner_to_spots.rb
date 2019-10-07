class AddOwnerToSpots < ActiveRecord::Migration[5.2]
  def change
    add_reference :spots, :owner, index: true
  end
end
