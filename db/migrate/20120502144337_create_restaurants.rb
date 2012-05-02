class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :theme
      t.string :image
      t.integer :price_range
      t.string :payment_options
      t.integer :service
      t.integer :time
      t.string :location
      t.string :area
      t.integer :vegi

      t.timestamps
    end
  end
end
