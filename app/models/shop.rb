class Shop < ActiveRecord::Base
  validates_presence_of :name
  validates_format_of :slug, :with => /\A([-a-z0-9]+)?\Z/
  before_save lambda { self.slug.blank? ? self.slug = self.name.parameterize : nil }

  has_attached_file :logo, :styles => { :original => '500x100>', :thumb => '200x100>' }
end
