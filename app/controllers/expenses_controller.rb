class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit, :update, :destroy]

  def new
    @expense = Expense.new
    render_no_layout
  end

  def edit
    render_no_layout
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      @expenses = Expense.by_quarter @expense.issued_at
    end
    respond_to do |format|
      format.js { render 'update', layout: false }
    end
  end

  def update
    old_date = @expense.issued_at
    if @expense.update(expense_params)
      @expenses = Expense.by_quarter old_date
    end
    respond_to do |format|
      format.js { render 'update', layout: false }
    end
  end

  def destroy
    @expense.destroy
    @expenses = Expense.by_quarter @expense.issued_at
    render_no_layout
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:issued_at, :description, :total_price, :tax_price, :document)
  end
end
