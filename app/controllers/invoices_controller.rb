class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:edit, :update, :destroy]

  def new
    @invoice = Invoice.new
  end

  def edit
  end

  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to home_path(date: @invoice.invoiced_at), notice: 'Invoice was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to home_path(date: @invoice.invoiced_at), notice: 'Invoice was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to home_path(date: @invoice.invoiced_at), notice: 'Invoice was successfully destroyed.' }
    end
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:invoiced_at, :name, :total_price, :tax_price)
  end
end

