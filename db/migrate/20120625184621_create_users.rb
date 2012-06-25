class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :company_id
      t.string :role

      t.timestamps
    end
  end
end
