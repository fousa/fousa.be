class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:edit, :update, :destroy]

  def new
    @invoice = Invoice.new
    render_no_layout
  end

  def edit
    render_no_layout
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      @invoices = Invoice.by_quarter @invoice.invoiced_at
    end
    respond_to do |format|
      format.js { render 'update', layout: false }
    end
  end

  def update
    old_date = @invoice.invoiced_at
    if @invoice.update(invoice_params)
      @invoices = Invoice.by_quarter old_date
    end
    respond_to do |format|
      format.js { render 'update', layout: false }
    end
  end

  def destroy
    @invoice.destroy
    @invoices = Invoice.by_quarter @invoice.invoiced_at
    render_no_layout
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:invoiced_at, :name, :total_price, :tax_price)
  end
end

