# encoding: utf-8

class ScreenshotUploader < ImageUploader
  version :retina do
    process :resize_to_fit => [1600, 1200]
  end

  version :non_retina do
    process :resize_to_fit => [800, 600]
  end
end
