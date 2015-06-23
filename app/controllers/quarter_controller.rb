class QuarterController < ApplicationController
  include Zipline
  include DateHelper

  before_action :set_date, only: :show

  def show
    @expenses = Expense.by_quarter @filter_date
    @invoices = Invoice.by_quarter @filter_date

    respond_to do |format|
      format.html
      format.zip do
        overview = QuarterDocument.new(@filter_date, @expenses, @invoices)
        overview_tmp_file = Tempfile.new("overview_tmp_file_#{Process.pid}.pdf")
        overview.render_file(overview_tmp_file.path)
        documents =  @expenses.map do |expense|
          [expense.document, "expenses/#{expense.filename}.pdf"] 
        end
        documents << [overview_tmp_file, 'expenses.pdf']
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
end
