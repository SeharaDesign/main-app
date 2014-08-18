class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :product_id
      t.date :date_of_event
      t.boolean :complete, default: false
      t.boolean :shipped, default: false 

      t.timestamps
    end
  end
end
