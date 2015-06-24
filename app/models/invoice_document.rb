# encoding: UTF-8

class InvoiceDocument < Document

  def initialize(invoice)
    @invoice = invoice
  end

  def render_document
    super

    @x = @pdf.bounds.right - 250
    @y = @pdf.bounds.top

    draw_logo
    draw_account_data
    draw_title
    draw_customer
    draw_invoice
    draw_item
    draw_totals
    draw_footer
  end

  private

  def account
    {
      name: ENV['ACCOUNT_NAME'],
      address: ENV['ACCOUNT_ADDRESS'],
      postal_code: ENV['ACCOUNT_POSTAL_CODE'],
      city: ENV['ACCOUNT_CITY'],
      country: ENV['ACCOUNT_COUNTRY'],
      phone: ENV['ACCOUNT_PHONE'],
      email: ENV['ACCOUNT_EMAIL'],
      bank: ENV['ACCOUNT_BANK'],
      bank_number: ENV['ACCOUNT_BANK_NUMBER'],
      vat_number: ENV['ACCOUNT_VAT_NUMBER']
    }
  end

  def draw_logo
    @pdf.image "#{Rails.root}/app/assets/images/fousa.png", at: [@x, @y], 
                                                            height: 100, 
                                                            width: 100
  end

  def draw_account_data
    @pdf.fill_color "#33353F"
    @x += 110

    @pdf.text_box account[:name], at: [@x, @y], mode: :fill
    @pdf.text_box account[:address], at: [@x, @y-20], mode: :fill
    @pdf.text_box "#{account[:postal_code]} #{account[:city]}", at: [@x, @y-35], mode: :fill
    @pdf.text_box account[:country], at: [@x, @y-50], mode: :fill
    @pdf.text_box account[:phone], at: [@x, @y-75], mode: :fill
    @pdf.text_box account[:email], at: [@x, @y-90], mode: :fill
  end

  def draw_title
    @pdf.move_down 150
    @pdf.text 'Invoice', size: 20
  end

  def draw_customer
    @pdf.move_down 30
    @pdf.text @invoice.customer.name
    @pdf.move_down 5
    @pdf.text @invoice.customer.address
    @pdf.move_down 5
    @pdf.text @invoice.customer.format_city
    @pdf.move_down 5
    @pdf.text @invoice.customer.format_country
    @pdf.move_down 5
    @pdf.text @invoice.customer.format_vat
  end

  def draw_invoice
    @y -= 200
    @pdf.text_box @invoice.format_invoice_number, at: [@x-100, @y], mode: :fill, align: :right
    @pdf.text_box @invoice.format_invoiced_at, at: [@x-100, @y-15], mode: :fill, align: :right
  end

  def draw_item
    @pdf.move_down 30
    data = [["Description", 'Units', 'Unit Price', 'Subtotal']]
    data << [@invoice.name, '1', number_to_currency(@invoice.net_price), number_to_currency(@invoice.net_price)]
    @pdf.table data, header: true,
                     column_widths: [246, 75, 100, 100],
                     cell_style: { borders: {}, padding: 7, align: :right } do
      row(0).style(borders: [:bottom])
      row(data.count - 1).style(borders: [:bottom])
      column(0).style(align: :left)
    end
  end

  def draw_totals
    data = [
        ['Subtotal', number_to_currency(@invoice.net_price)],
        ["VAT #{number_to_percentage(@invoice.tax_percentage)}", number_to_currency(@invoice.tax_price)],
        ['Total', number_to_currency(@invoice.total_price)]
    ]
    @pdf.table data, column_widths: [@pdf.bounds.width - 100, 100],
                     cell_style: { borders: {}, padding: 7, align: :right }
  end

  def draw_footer
    y = @pdf.bounds.bottom + 20
    @pdf.text_box "#{account[:name]} - #{account[:bank]} #{account[:bank_number]} - VAT #{account[:vat_number]}", at: [0, y], 
                                                                                                                  mode: :fill, 
                                                                                                                  size: 10, 
                                                                                                                  align: :center
  end
end
