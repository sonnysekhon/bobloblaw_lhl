class AddAddressToBusinessTable < ActiveRecord::Migration
  def change
    change_table :businesses do |t|
      t.string   "website"
      t.string   "address"
      t.string   "city"
      t.string   "postal_code"
      t.string   "province"
      t.string   "country"
    end
  end
end
