class RenameColInTips < ActiveRecord::Migration
  def change
    rename_column :tips, :restuarant_id, :restaurant_id
  end
end
