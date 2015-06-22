class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit, :update, :destroy]
  before_action :set_date, only: :index

  def index
    @expenses = Expense.by_quarter @filter_date
  end

  def new
    @expense = Expense.new
  end

  def edit
  end

  def create
    @expense = Expense.new(expense_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to expenses_path(date: @expense.issued_at), notice: 'Expense was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to expenses_path(date: @expense.issued_at), notice: 'Expense was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_path(date: @expense.issued_at), notice: 'Expense was successfully destroyed.' }
    end
  end

  private

  def set_date
    @filter_date = Date.parse params[:date]
  rescue
    @filter_date = Date.today if @filter_date.nil?
  end

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:issued_at, :description, :total_price, :tax_price)
  end
end
