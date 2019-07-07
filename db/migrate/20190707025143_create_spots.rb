class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :category
      t.string :sub_category
      t.text :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :phone_number
      t.string :website
      t.string :photo_url
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
