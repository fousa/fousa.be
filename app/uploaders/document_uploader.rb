# encoding: utf-8

class DocumentUploader < CarrierWave::Uploader::Base
  storage :dropbox

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(pdf)
  end
end
