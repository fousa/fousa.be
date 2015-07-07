# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWaveDirect::Uploader

  version :thumbnail do
    process resize_to_fill: [100, 100]
  end

  def store_dir
    "images/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.asset_path([model.class.to_s.underscore, "default.png"].compact.join('_'))
  end

  def extension_white_list
    %w(jpg png)
  end
end
