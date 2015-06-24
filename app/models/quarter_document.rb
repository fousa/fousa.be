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

    @pdf.font "Bold"
    @pdf.text format_quarter_date(@date), size: 30
    @pdf.move_down 20
    @pdf.font "Normal"

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
     "Normal" => { 
       normal: "#{Rails.root}/app/assets/fonts/Corbert-Regular-webfont.ttf",
       bold: "#{Rails.root}/app/assets/fonts/Novecentowide-Bold-webfont.ttf" 
     },
     "Bold" => { 
       normal: "#{Rails.root}/app/assets/fonts/Novecentowide-Bold-webfont.ttf",
       bold: "#{Rails.root}/app/assets/fonts/Novecentowide-Bold-webfont.ttf" 
     }
    )
  end

  def draw_invoices
    @pdf.text "Income", size: 20
    @pdf.move_down 10

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
    draw_table data
  end

  def draw_expenses
    @pdf.text "Expenses", size: 20
    @pdf.move_down 10

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
    draw_table data
  end

  def draw_table data
    @pdf.table(data, header: true, 
                     width: @pdf.bounds.width, 
                     row_colors: ['eeeeee', 'ffffff'],
                     cell_style: { borders: {}, padding: 7 }) do |table|
      data.each_with_index { |d, i| table.row(i).style(:borders => [:bottom]) }

      table.row(0).font_style = :bold
    
      table.column(0).style(align: :right)
      table.column(3).style(align: :right)
    end
  end
end
