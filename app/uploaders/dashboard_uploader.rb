# encoding: utf-8

class DashboardUploader < ImageUploader
  process :resize_to_fit => [800, 600]
end
