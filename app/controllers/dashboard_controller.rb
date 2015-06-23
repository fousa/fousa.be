class DashboardController < ApplicationController
  def show
    @quarters = Expense.all + Invoice.all
    @quarters = @quarters.group_by{ |u| u.date.beginning_of_quarter }

    respond_to do |format|
      format.html
    end
  end
end
