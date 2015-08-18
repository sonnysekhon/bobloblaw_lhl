class RemoveNameColumns < ActiveRecord::Migration
  def change
    remove_column :users, :firstname
    remove_column :users, :lastname
    remove_column :users, :email

    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :email, :string
  end
end
