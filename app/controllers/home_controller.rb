class HomeController < ApplicationController
  before_action :set_date, only: :show

  def show
    @expenses = Expense.by_quarter @filter_date
    @invoices = Invoice.by_quarter @filter_date
  end

  private

  def set_date
    @filter_date = Date.parse params[:date]
  rescue
    @filter_date = Date.today if @filter_date.nil?
  end
end
