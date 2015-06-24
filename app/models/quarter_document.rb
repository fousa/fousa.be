# encoding: UTF-8

class QuarterDocument
  include DateHelper
  include ActionView::Helpers

  def initialize(date, expenses, invoices)
    @invoices = invoices
    @expenses = expenses
    @date = date
  end

  def render_document
    @pdf = Prawn::Document.new page_size: "A4", 
                               page_layout: :portrait

    initialize_fonts

    @pdf.font "Corbert"
    @pdf.text format_quarter_date(@date), size: 30, align: :center
    @pdf.move_down 20

    draw_invoices
    @pdf.move_down 20

    draw_expenses
  end

  def render_file(filename)
    render_document
    @pdf.render_file(filename)
  end

  private

  def initialize_fonts
    @pdf.font_families.update( 
     "Corbert" => { normal: "#{Rails.root}/app/assets/fonts/Corbert-Regular-webfont.ttf" }
    )
  end

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

  def draw_table data
    maxed_width = (@pdf.bounds.width - 80 - 80) / 2
    @pdf.table(data, header: true, 
                     width: @pdf.bounds.width, 
                     row_colors: ['eeeeee', 'ffffff'],
                     column_widths: [80, maxed_width, maxed_width, 80],
                     cell_style: { borders: {}, padding: 7, size: 8 }) do |table|
      data.each_with_index { |d, i| table.row(i).style(:borders => [:bottom]) }

      table.column(0).style(align: :right)
      table.column(3).style(align: :right)
    end
  end
end
