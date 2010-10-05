class Shop < ActiveRecord::Base
  validates_presence_of :name
  validates_format_of :slug, :with => /\A([-a-z0-9]+)?\Z/
  before_save lambda { self.slug.blank? ? self.slug = self.name.parameterize : nil }
end
