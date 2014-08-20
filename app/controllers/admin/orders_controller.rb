class Admin::OrdersController < ApplicationController
  helper Admin::OrdersHelper
  
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end   

  def create
    order = Order.new(order_params)
    
    if order.save
      redirect_to admin_orders_path
    else
      render :new
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])

    if order.update(order_params)
      redirect_to admin_orders_path
    else
      render :edit
    end
  end

  def destroy
    order = Order.find(params[:id])
    if order.destroy
      flash[:notice] = "The order has been permanently deleted."
    end
    redirect_to admin_orders_path
  end

  private

  def order_params
    params.require(:order).permit!
  end

end
