class AddMoreColumnsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
    end
  end
end
