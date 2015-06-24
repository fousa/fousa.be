# encoding: UTF-8

class InvoiceDocument < Document

  def initialize(date)
    @date = date
  end

  def render_document
    super

    @pdf.text 'invoice', size: 30, align: :center
  end
end
