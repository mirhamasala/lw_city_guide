class RemoveRemotePhotoUrlFromCities < ActiveRecord::Migration[5.2]
  def change
    remove_column :cities, :remote_photo_url
  end
end
