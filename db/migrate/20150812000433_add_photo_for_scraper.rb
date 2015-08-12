class AddPhotoForScraper < ActiveRecord::Migration
  def change
    change_table :businesses do |t|
      t.string :photo

    end
  end
end
