class CreateTables < ActiveRecord::Migration
  def change
    
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password_digest
      t.string :photo
      t.string :type, default: 'customer'
      t.timestamps
    end

    create_table :businesses do |t|
      t.references :user
      t.string :category
      t.string :name
      t.string :phone
      t.string :email
      t.string :photo
      t.text :description
      t.boolean :featured
      t.timestamps
    end

    create_table :addresses do |t|
      t.references :business
      t.string :street_number
      t.string :unit_number
      t.string :street_name
      t.string :city
      t.string :province
      t.string :country
      t.timestamps
    end

    create_table :layouts do |t|
      t.references :business
      t.string :template
      t.string :main_color
      t.string :secondary_color
      t.string :accent_color
      t.timestamps
    end
  end
  
end
