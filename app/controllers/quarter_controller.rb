class QuarterController < ApplicationController
  include Zipline
  include DateHelper

  before_action :set_date, only: :show

  def show
    @expenses = Expense.by_quarter @filter_date
    @invoices = Invoice.by_quarter @filter_date

    respond_to do |format|
      format.html
      format.pdf { render layout: false }
      format.zip {
        documents =  @expenses.map { |expense| [expense.document, "#{expense.filename}.pdf"] }
        zipline(documents, "#{format_quarter_date(@filter_date)}.zip")
      }
    end
  end

  private

  def set_date
    @filter_date = Date.parse params[:date]
  rescue
    @filter_date = Date.today if @filter_date.nil?
  end
end
