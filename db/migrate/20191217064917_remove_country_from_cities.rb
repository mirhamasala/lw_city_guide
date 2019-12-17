class RemoveCountryFromCities < ActiveRecord::Migration[5.2]
  def change
    remove_column :cities, :country, :string
  end
end
