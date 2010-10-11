class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_and_belongs_to_many :options
end
