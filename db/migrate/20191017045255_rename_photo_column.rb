class RenamePhotoColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :cities, :photo, :cover
  end
end
