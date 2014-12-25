class ChargesController < ApplicationController
  helper ChargesHelper
  require_dependency Rails.root.join('lib', 'data', 'sehara_model_creation')

  def new
  end

  def create
    model_objects = Data::SeharaModelCreation.write_to_database(customer_params, shipping_params, order_params)

    if model_objects.map { |x| x.errors.any? }.include?(true)
      flash[:notice] = model_objects.map { |x| x.errors.full_messages }.flatten << "Your credit card was NOT charged."
      redirect_to checkout_product_path(order_params[:product_id])
    else
      flash[:success] = "Your order was successfully processed."

      begin # Stripe card processing
      amount = Product.calculate_price_in_cents(Product.find(order_params[:product_id]))

      customer = Stripe::Customer.create(
        :email => model_objects[0].email,
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

      redirect_to root_url
    end
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
