class Shop < ActiveRecord::Base
  Locales = { 'da' => 'Danish', 'en' => 'English' }

  validates_presence_of :name
  validates_format_of :slug, :with => /\A([-a-z0-9]+)?\Z/
  validates_uniqueness_of :slug
  validates_inclusion_of :locale, :in => Locales.each_key
  before_save lambda { self.slug.blank? ? self.slug = self.name.parameterize : nil }

  has_attached_file :logo, :styles => { :original => '500x100>', :thumb => '200x100>' }

  def locales_for_select
    Locales.invert
  end

  def locale_text
    Locales[self.locale]
  end
end
