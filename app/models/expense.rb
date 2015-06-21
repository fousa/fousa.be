class Expense < ActiveRecord::Base
  validates :issued_at, presence: true
  validates :description, presence: true
end
