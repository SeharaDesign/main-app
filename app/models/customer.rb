class Customer < ActiveRecord::Base

  has_many :shipping_addresses
  has_many :orders
  has_many :products, through: :orders

  validates :phone, length: { minimum: 10, message: "must be at least 10 numeric characters" }
  validates :email, confirmation: true
  validates :email_confirmation, :first_name, :last_name, :phone, presence: true

  
end
