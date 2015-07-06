class App < ActiveRecord::Base
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  markdownize! :text

  has_many :screenshots

  validates :name, presence: true, uniqueness: { scope: :name_suffix }
  validates :short_text, presence: true

  mount_uploader :dashboard_image, ImageUploader

  accepts_nested_attributes_for :screenshots, :reject_if => :all_blank, :allow_destroy => true
  
  attr_accessor :another

  default_scope { order(:name).order(:name_suffix) }

  def full_name
    full_name = name
    full_name << " #{name_suffix}" unless name_suffix.nil?
    full_name
  end
end
