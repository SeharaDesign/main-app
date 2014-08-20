class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @images = Image.where(product_id: @product.id).pluck(:source)
  end

  def checkout
    @product = Product.find(params[:id])
    @customer = Customer.new
    @order = Order.new
    @shipping_address = ShippingAddress.new
  end
end
