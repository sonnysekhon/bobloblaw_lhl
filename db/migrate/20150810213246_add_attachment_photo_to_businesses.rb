class AddAttachmentPhotoToBusinesses < ActiveRecord::Migration
  def self.up
    change_table :businesses do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :businesses, :photo
  end
end
