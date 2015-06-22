class Invoice < ActiveRecord::Base
  validates :invoiced_at, presence: true
  validates :name, presence: true

  scope :by_quarter, ->(date) do
    where('invoices.invoiced_at >= ?', date.beginning_of_quarter)
    .where('invoices.invoiced_at <= ?', date.end_of_quarter)
    .order(:invoiced_at)
  end

  def complete?
    total_price.present? && tax_price.present?
  end
end
