class Order < ActiveRecord::Base

  belongs_to :product
  belongs_to :customer

  validates :date_of_event, presence: true

  def order_completed?
    self.complete? ? "Yes" : "No"
  end
  
  def order_shipped?
    self.shipped? ? "Yes" : "No"
  end
  
end
