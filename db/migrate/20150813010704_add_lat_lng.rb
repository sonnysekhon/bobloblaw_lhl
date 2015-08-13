class AddLatLng < ActiveRecord::Migration
  def change
    change_table :businesses do |t|
      t.float :longitude
      t.float :latitude
    end
  end
end
