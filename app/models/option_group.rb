class OptionGroup < ActiveRecord::Base
  belongs_to :product
  has_many :options
  accepts_nested_attributes_for :options
end
