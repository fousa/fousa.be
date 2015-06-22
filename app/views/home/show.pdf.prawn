prawn_document() do |pdf|
  def draw_table pdf, data
    pdf.table(data, header: true, width: pdf.bounds.width, row_colors: ['eeeeee', 'ffffff']) do |table|
      table.row(0).font_style = :bold
    
      table.column(0).style(align: :right)
      table.column(3).style(align: :right)
    end
  end

  pdf.text format_quarter_date(@filter_date), size: 30
  pdf.move_down 20

  pdf.text "Income", size: 20
  data = [[
    "Date",
    "Description",
    "Filename",
    "Total price"
  ]]
  @invoices.each do |invoice|
    data << [
      I18n.l(invoice.invoiced_at, format: :long),
      invoice.name,
      invoice.filename,
      number_to_currency(invoice.total_price)
    ]
  end
  draw_table pdf, data
  pdf.move_down 20

  pdf.text "Expenses", size: 20
  data = [[
    "Date",
    "Description",
    "Filename",
    "Total price"
  ]]
  @expenses.each do |expense|
    data << [
      I18n.l(expense.issued_at, format: :long),
      expense.description,
      expense.filename,
      number_to_currency(expense.total_price)
    ]
  end
  draw_table pdf, data
end
