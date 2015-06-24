# encoding: UTF-8

class QuarterDocument < Document

  def initialize(date, expenses, invoices)
    @invoices = invoices
    @expenses = expenses
    @date = date
  end

  def render_document
    super

    @pdf.text format_quarter_date(@date), size: 30, align: :center
    @pdf.move_down 20

    draw_invoices
    @pdf.move_down 20

    draw_expenses
  end

  private

  def draw_invoices
    @pdf.text "Income", size: 20
    @pdf.move_down 10

    data = [[
      "Date".upcase,
      "Description".upcase,
      "Filename".upcase,
      "Total price".upcase
    ]]
    @invoices.each do |invoice|
      data << [
        I18n.l(invoice.invoiced_at, format: :long),
        invoice.name,
        invoice.filename,
        number_to_currency(invoice.total_price)
      ]
    end
    draw_table data
  end

  def draw_expenses
    @pdf.text "Expenses", size: 20
    @pdf.move_down 10

    data = [[
      "Date".upcase,
      "Description".upcase,
      "Filename".upcase,
      "Total price".upcase
    ]]
    @expenses.each do |expense|
      data << [
        I18n.l(expense.issued_at, format: :long),
        expense.description,
        expense.filename,
        number_to_currency(expense.total_price)
      ]
    end
    draw_table data
  end
end
