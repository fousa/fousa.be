class Screenshot < ActiveRecord::Base
  belongs_to :app

  mount_uploader :image, ScreenshotUploader

  default_scope { order(:id) }
end
