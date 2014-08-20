class Product < ActiveRecord::Base
  
  has_many :images
  has_many :orders
  has_many :customers, through: :orders

  scope :recently_purchased, ->(order) { where(id: order.product_id).take }

  def images
    Image.where(product_id: self.id).pluck(:source)
  end

  def update_units_sold
    self.update(units_sold: self.units_sold += 1)
  end

  # Class methods

  def self.calculate_price_in_cents(product)
    product.price * 100
  end
end
