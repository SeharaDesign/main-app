class RemoveShippingAddressFromCustomer < ActiveRecord::Migration
  def change
    remove_column :customers, :street_address
    remove_column :customers, :city
    remove_column :customers, :state
    remove_column :customers, :zip

    add_column :customers, :shipping_address_id, :integer
  end
end
