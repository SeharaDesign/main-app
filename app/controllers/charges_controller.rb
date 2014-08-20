class ChargesController < ApplicationController
  helper ChargesHelper

  def new
  end

  def create

    # Create DB records
    @customer = Customer.find_or_create_by(customer_params)
    @shipping_address = ShippingAddress.create(shipping_params)
    @order = Order.create(order_params)
    @customer.shipping_addresses << @shipping_address
    @customer.orders << @order
    @product = Product.recently_purchased(@order)
    @product.update_units_sold

    # Stripe card processing
    amount = Product.calculate_price_in_cents(@product)

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  
  end

  private

  def customer_params
    params.require(:customer).permit!
  end

  def shipping_params
    params.require(:shipping_address).permit!
  end

  def order_params
    params.require(:order).permit!
  end

end
