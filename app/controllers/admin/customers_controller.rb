class Admin::CustomersController < ApplicationController
  helper Admin::CustomersHelper

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    
    if @customer.save
      redirect_to admin_customers_path
      flash[:success] = "Your customer has been successfully created."
    else
      render :new
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)
      redirect_to admin_customers_path
      flash[:success] = "Your customer has been updated."
    else
      render :edit
    end 
  end

  def destroy
    customer = Customer.find(params[:id])
    if customer.destroy
      flash[:notice] = "The order has been permanently deleted."
    end
    redirect_to admin_customers_path
  end

  private

    def customer_params
      params.require(:customer).permit!
    end
end
