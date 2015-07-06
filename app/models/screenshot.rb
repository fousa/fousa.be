class Screenshot < ActiveRecord::Base
  belongs_to :app

  validates :name, presence: true

  mount_uploader :image, ImageUploader

  default_scope { order(:name) }
end
