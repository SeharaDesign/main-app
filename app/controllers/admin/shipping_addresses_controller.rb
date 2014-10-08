class Admin::ShippingAddressesController < ApplicationController

  def index
    @customer = Customer.find(params[:customer_id])
    @addresses = @customer.shipping_addresses
  end

  def new
    @address = ShippingAddress.new
  end

  def create
    @address = ShippingAddress.new(shipping_address_params)

    if @address.save
      customer = Customer.find(params[:customer_id])
      customer.shipping_addresses << @address
      redirect_to admin_customer_shipping_addresses_path(customer)
      flash[:success] = "Shipping address successfully associated with customer"
    else
      render 'new'
    end
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @address = ShippingAddress.find(params[:id])
  end

  def update
    @address = ShippingAddress.find(params[:id])

    if @address.update(shipping_address_params)
      customer = Customer.find(params[:customer_id])
      customer.shipping_addresses << @address
      redirect_to admin_customer_shipping_addresses_path(customer)
      flash[:success] = "Shipping address successfully updated"
    else
      render 'edit'
    end
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit!
  end

end
