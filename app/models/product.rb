class Product < ActiveRecord::Base
  validates_presence_of :name

  has_attached_file :image, :styles => { :original => '800x800>', :thumb => '200x200>' }
end
