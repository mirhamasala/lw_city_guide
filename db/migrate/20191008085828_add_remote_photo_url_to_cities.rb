class AddRemotePhotoUrlToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :remote_photo_url, :string
  end
end
