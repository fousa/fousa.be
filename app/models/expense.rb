class Expense < ActiveRecord::Base
  validates :issued_at, presence: true
  validates :description, presence: true, uniqueness: { scope: :issued_at }

  mount_uploader :document, DocumentUploader

  attr_accessor :another

  scope :by_quarter, ->(date) do
    where('expenses.issued_at >= ?', date.beginning_of_quarter)
    .where('expenses.issued_at <= ?', date.end_of_quarter)
    .order(:issued_at)
  end

  def complete?
    total_price.present? && tax_price.present? && document_exists?
  end

  def filename
    "#{I18n.l(issued_at, format: :filename)} - #{description}"
  end

  def date
    issued_at
  end

  def net_price
    (total_price || 0) - (tax_price || 0)
  end
end
