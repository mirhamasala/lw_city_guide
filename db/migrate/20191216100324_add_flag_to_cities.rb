class AddFlagToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :flag, :string
  end
end
