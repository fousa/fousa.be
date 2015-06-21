class Expense < ActiveRecord::Base
  validates :issued_at, presence: true
  validates :description, presence: true

  def complete?
    total_price.present? && tax_price.present?
  end
end
