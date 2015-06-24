class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
    render_no_layout
  end

  def edit
    render_no_layout
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      @customers = Customer.all
    end
    respond_to do |format|
      format.js { render 'update', layout: false }
    end
  end

  def update
    if @customer.update(customer_params)
      @customers = Customer.all
    end
    respond_to do |format|
      format.js { render 'update', layout: false }
    end
  end

  def destroy
    @customer.destroy
    @customers = Customer.all
    render_no_layout
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :vat_number, :address, :postal_code, :city, :country)
  end
end
