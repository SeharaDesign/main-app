class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country, default: "US"

      t.timestamps
    end
  end
end
