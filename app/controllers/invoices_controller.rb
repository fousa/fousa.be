class InvoicesController < AuthenticatedController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  def show
    respond_to do |format|
      format.html
      format.pdf do
        send_file render_invoice_document, filename: "#{@invoice.filename}.pdf", 
                                           type: "application/pdf", 
                                           disposition: 'inline'
      end
    end
  end

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
      @invoices = Invoice.by_quarter filter_date
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
    @invoices = Invoice.by_quarter filter_date
    render_no_layout
  end

  private

  def filter_date
    if params[:filter_date].nil? || params[:filter_date].blank?
      Date.today
    else
      Date.parse params[:filter_date]
    end
  end

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:invoiced_at, :name, :net_price, :tax_percentage, :customer_id)
  end

  def render_invoice_document
    invoice = InvoiceDocument.new(@invoice)
    invoice_tmp_file = Tempfile.new("invoice_tmp_file_#{Process.pid}.pdf")
    invoice.render_file(invoice_tmp_file.path)
    invoice_tmp_file
  end
end

