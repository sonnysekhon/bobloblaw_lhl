class AddIndiceToReferences < ActiveRecord::Migration
  def change
      
      add_index :businesses, :user_id
      add_index :addresses, :business_id
      add_index :layouts, :business_id
    
  end
  
end
