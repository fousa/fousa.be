# encoding: utf-8

class ScreenshotUploader < ImageUploader
  process :resize_to_fit => [1600, 1200]
end
