# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWaveDirect::Uploader

  def store_dir
    "images/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.asset_path([model.class.to_s.underscore, "default.jpg"].compact.join('_'))
  end

  def extension_white_list
    %w(jpg png)
  end
end
