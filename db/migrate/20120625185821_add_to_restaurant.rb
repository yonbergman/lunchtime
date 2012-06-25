class AddToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :menu_url, :string
    add_column :restaurants, :address, :string
  end

end
