class App < ActiveRecord::Base
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  validates :name, presence: true, uniqueness: { scope: :name_suffix }
  validates :short_text, presence: true

  mount_uploader :dashboard_image, ImageUploader

  attr_accessor :another

  default_scope { order(:name).order(:name_suffix) }

  def full_name
    full_name = name
    full_name << " #{name_suffix}" unless name_suffix.nil?
    full_name
  end
end
