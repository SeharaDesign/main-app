class ProductsController < ApplicationController

  def index
    @hera = Product.find_by_name('Hera')
    @hera_images = Image.where(product_id: @hera.id).pluck(:source)
    @selene = Product.find_by_name('Selene')
    @selene_images = Image.where(product_id: @selene.id).pluck(:source)
    @rhea = Product.find_by_name('Rhea')
    @rhea_images = Image.where(product_id: @rhea.id).pluck(:source)

    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @images = Image.where(product_id: @product.id).pluck(:source)
  end
end
