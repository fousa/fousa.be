class Invoice < ActiveRecord::Base
  include ActionView::Helpers

  validates :invoiced_at, presence: true
  validates :name, presence: true
  validates :customer, presence: true

  before_validation :generate_number

  belongs_to :customer

  attr_accessor :another

  scope :by_quarter, ->(date) do
    where('invoices.invoiced_at >= ?', date.beginning_of_quarter)
    .where('invoices.invoiced_at <= ?', date.end_of_quarter)
    .order(:invoiced_at)
  end

  def complete?
    net_price.present?
  end

  def filename
    "#{I18n.l(invoiced_at, format: :filename)} - #{name}"
  end

  def date
    invoiced_at
  end

  def invoice_number
    "#{invoiced_at.year}/#{sprintf("%03d", number)}"
  end

  def total_price
    (net_price || 0) + tax_price
  end

  def tax_price
    (net_price || 0) / 100 * (tax_percentage || 0)
  end

  def format_invoice_number
    "Invoice number: #{invoice_number}"
  end

  def format_invoiced_at
    "Invoice date: #{I18n.l(invoiced_at, format: :long)}"
  end

  def format_vat_price
    "VAT #{number_to_percentage(tax_percentage)}: #{number_to_currency(tax_price)}"
  end

  private

  def generate_number
    maximum_number = Invoice.maximum(:number) || ENV['INVOICE_START_NUMBER'].try(:to_i) || 0
    self.number = maximum_number + 1
  end
end
