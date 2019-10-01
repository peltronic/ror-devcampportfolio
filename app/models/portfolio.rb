class Portfolio < ApplicationRecord
  has_many :technologies
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image
  
  # Custom Scope (1)
  def self.angular
    where(subtitle: 'Angular')
  end

  # Custom Scope (2), using labmdas
  scope :ruby_on_rails, ->  { where(subtitle: 'Ruby on Rails') } 

  after_initialize :set_defaults

  # a callback
  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
