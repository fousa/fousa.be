class QuarterController < AuthenticatedController
  include Zipline
  include DateHelper

  before_action :set_date, only: :show

  def show
    @expenses = Expense.by_quarter @filter_date
    @invoices = Invoice.by_quarter @filter_date

    respond_to do |format|
      format.html
      format.pdf do
        send_file render_overview_document, filename: "#{format_quarter_date(@filter_date)}.pdf", 
                                            type: "application/pdf", 
                                            disposition: 'inline'
      end
      format.zip do
        documents = @expenses.select { |e| e.document? }.map do |expense|
          [expense.document, "expenses/#{expense.filename}.pdf"] 
        end
        @invoices.map do |invoice|
          documents << [render_invoice_document(invoice), "invoices/#{invoice.filename}.pdf"] 
        end
        documents << [render_overview_document, "#{format_quarter_date(@filter_date)}.pdf"]
        zipline(documents, "#{format_quarter_date(@filter_date)}.zip")
      end
    end
  end

  private

  def set_date
    @filter_date = Date.parse params[:date]
  rescue
    @filter_date = Date.today if @filter_date.nil?
  end

  def render_overview_document
    document = QuarterDocument.new(@filter_date, @expenses, @invoices)
    document_tmp_file = Tempfile.new("#{format_quarter_date(@filter_date)}-#{Process.pid}.pdf")
    document.render_file(document_tmp_file.path)
    document_tmp_file
  end

  def render_invoice_document invoice
    document = InvoiceDocument.new(invoice)
    document_tmp_file = Tempfile.new("#{invoice.filename}-#{Process.pid}.pdf")
    document.render_file(document_tmp_file.path)
    document_tmp_file
  end
end
