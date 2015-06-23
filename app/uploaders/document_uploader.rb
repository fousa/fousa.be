# encoding: utf-8

class DocumentUploader < CarrierWave::Uploader::Base
  include DateHelper

  storage :dropbox

  def filename
    "#{model.filename}.pdf"
  end

  def store_dir
    format_quarter_date(model.date)
  end

  def extension_white_list
    %w(pdf)
  end
end
