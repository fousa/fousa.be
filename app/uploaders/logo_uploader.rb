# encoding: utf-8

class LogoUploader < ImageUploader
  process :resize_to_fit => [400, 400]
end
