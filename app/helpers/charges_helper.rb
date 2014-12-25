module ChargesHelper

  def full_name(customer)
    "#{customer.first_name} #{customer.last_name}" 
  end

  def shipping_address(shipping_address)
    "#{shipping_address.city}, #{shipping_address.state} #{shipping_address.zip}"
  end

  def name_and_price(product)
    "You were charged #{product.price} USD for Sehara's #{product.name}."
  end
end
