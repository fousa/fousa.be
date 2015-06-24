class Invoice < ActiveRecord::Base
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
    total_price.present? && tax_price.present?
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

  def net_price
    (total_price || 0) - (tax_price || 0)
  end

  private

  def generate_number
    maximum_number = Invoice.maximum(:number) || ENV['INVOICE_START_NUMBER'].try(:to_i) || 0
    self.number = maximum_number + 1
  end
end
