class AddHeadingToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :heading, :integer
  end
end
