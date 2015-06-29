class App < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :name_suffix }
  validates :short_text, presence: true

  attr_accessor :another

  default_scope { order(:name).order(:name_suffix) }
end
