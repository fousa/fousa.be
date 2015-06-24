# encoding: UTF-8

class Document
  include DateHelper
  include ActionView::Helpers

  def render_document
    @pdf = Prawn::Document.new page_size: "A4", 
                               page_layout: :portrait

    initialize_fonts
  end

  def render_file(filename)
    render_document
    @pdf.render_file(filename)
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

  private

  def initialize_fonts
    @pdf.font_families.update( 
     "Corbert" => { normal: "#{Rails.root}/app/assets/fonts/Corbert-Regular-webfont.ttf" }
    )
    @pdf.font "Corbert"
  end
end
