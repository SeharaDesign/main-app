class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @images = @product.images
  end

  def checkout
    @product = Product.find(params[:id])
    @customer = Customer.new
    @order = Order.new
    @shipping_address = ShippingAddress.new
  end
end
