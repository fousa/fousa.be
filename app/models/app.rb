class App < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :name_suffix }
  validates :short_text, presence: true

  mount_uploader :dashboard_image, ImageUploader

  attr_accessor :another

  default_scope { order(:name).order(:name_suffix) }
end
