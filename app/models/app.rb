class App < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  markdownize! :text

  has_many :screenshots

  validates :name, presence: true
  validates :short_text, presence: true

  mount_uploader :dashboard_image, DashboardUploader
  mount_uploader :logo, LogoUploader

  accepts_nested_attributes_for :screenshots, :reject_if => :all_blank, :allow_destroy => true
  
  attr_accessor :another

  default_scope { order(:order) }

  def detail_url
    if url?
      url
    else
      self
    end
  end
end
