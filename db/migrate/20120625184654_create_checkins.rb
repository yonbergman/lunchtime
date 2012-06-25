class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps
    end
  end
end
