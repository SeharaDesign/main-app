class Customer < ActiveRecord::Base

  has_many :shipping_addresses
  has_many :orders
  has_many :products, through: :orders
  
end
