class RenamePhotoInBusiness < ActiveRecord::Migration
  def change
    rename_column :businesses, :photo, :photo_scraped
  end
end
