class RemoveExistingPhoto < ActiveRecord::Migration
  def change
    change_table :businesses do |t|

      t.remove :photo
    end
  end

  
end
