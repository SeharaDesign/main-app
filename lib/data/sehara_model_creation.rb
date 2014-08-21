require_dependency Rails.root.join('lib', 'data', 'sanitization')

class Data 
  class SeharaModelCreation < ActiveRecord::Base 
    
    def self.test
      Data::Sanitization.test
    end

    def self.write_to_database(*params)
      p params
      customer = Data::SeharaModelCreation.create_or_retrieve_customer(params[0])

      address = Data::SeharaModelCreation.create_or_retrieve_address(params[1], customer)

      order = Data::SeharaModelCreation.create_new_order(params[2], customer)

      product = Product.update_units_sold(order)

      [customer, address, order, product]
    end

    def self.create_or_retrieve_customer(params_hash)
      sanitized = Data::Sanitization.customer_data(params_hash)
      customer = Customer.find_by(email: sanitized[:email])
      if customer 
        customer.update(sanitized)
      else
        customer =  Customer.create(sanitized)
      end

      customer
    end

    def self.create_or_retrieve_address(params_hash, customer)
      sanitized = Data::Sanitization.shipping_address(params_hash)
      address = ShippingAddress.find_or_create_by(sanitized)
      customer.shipping_addresses << address

      address
    end

    def self.create_new_order(params_hash, customer)
      order = Order.create(params_hash)
      customer.orders << order

      order
    end
  end
end