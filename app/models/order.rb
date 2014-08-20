class Order < ActiveRecord::Base

  belongs_to :product
  belongs_to :customer

  def order_completed?
    self.complete? ? "Yes" : "No"
  end
  
  def order_shipped?
    self.shipped? ? "Yes" : "No"
  end  
end
