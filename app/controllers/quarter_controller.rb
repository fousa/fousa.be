class QuarterController < ApplicationController
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
        documents =  @expenses.map do |expense|
          [expense.document, "expenses/#{expense.filename}.pdf"] 
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
    overview = QuarterDocument.new(@filter_date, @expenses, @invoices)
    overview_tmp_file = Tempfile.new("overview_tmp_file_#{Process.pid}.pdf")
    overview.render_file(overview_tmp_file.path)
    overview_tmp_file
  end
end
