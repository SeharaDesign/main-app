module Admin::OrdersHelper

  def products
    Product.all
  end

  def customers
    Customer.all
  end
  
end
