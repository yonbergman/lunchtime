class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.integer :restuarant_id
      t.integer :checkin_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
