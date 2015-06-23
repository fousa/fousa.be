class Expense < ActiveRecord::Base
  validates :issued_at, presence: true
  validates :description, presence: true

  mount_uploader :document, DocumentUploader

  scope :by_quarter, ->(date) do
    where('expenses.issued_at >= ?', date.beginning_of_quarter)
    .where('expenses.issued_at <= ?', date.end_of_quarter)
    .order(:issued_at)
  end

  def complete?
    total_price.present? && tax_price.present?
  end

  def filename
    "#{I18n.l(issued_at, format: :filename)} - #{description}"
  end
end
