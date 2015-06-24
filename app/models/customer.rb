class Customer < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :vat_number, presence: true, uniqueness: true
  validates :address, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true

  attr_accessor :another

  default_scope { order(:name) }
end
