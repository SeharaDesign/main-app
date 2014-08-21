class ShippingAddress < ActiveRecord::Base

  belongs_to :customer

  validates :street_address, :city, :state, :zip, presence: true
  validates :zip, format: { with: /\d{5}-?\d{4}?/, message: "must take format of xxxxx or xxxxx-xxxx" }

end
