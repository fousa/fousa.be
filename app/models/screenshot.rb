class Screenshot < ActiveRecord::Base
  belongs_to :app

  validates :name, presence: true

  mount_uploader :image, ScreenshotUploader

  default_scope { order(:name) }
end
