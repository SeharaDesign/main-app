class AddForeignKeyToShippingAddresses < ActiveRecord::Migration
  def change
    remove_column :customers, :shipping_address_id
    add_column :shipping_addresses, :customer_id, :integer
  end
end
