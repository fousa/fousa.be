class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit, :update, :destroy]

  def new
    @expense = Expense.new
  end

  def edit
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def create
    @expense = Expense.new(expense_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to home_path(date: @expense.issued_at), notice: 'Expense was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    old_date = @expense.issued_at
    if @expense.update(expense_params)
      @expenses = Expense.by_quarter old_date
    end
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def destroy
    @expense.destroy
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:issued_at, :description, :total_price, :tax_price)
  end
end
