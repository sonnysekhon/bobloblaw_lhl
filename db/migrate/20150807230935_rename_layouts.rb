class RenameLayouts < ActiveRecord::Migration
  def change
    rename_table :layouts, :designs

    change_column_default :businesses, :featured, false
  end
end
