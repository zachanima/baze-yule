class Product < ActiveRecord::Base
  belongs_to :shop
  has_many :option_groups
  validates_presence_of :name

  has_attached_file :image, :styles => { :original => '800x800>', :thumb => '200x200>' }
end
