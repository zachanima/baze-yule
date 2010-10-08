class User < ActiveRecord::Base
  belongs_to :shop
  validates_presence_of :name
  validates_presence_of :username
  validates_presence_of :shop_id
  validates_uniqueness_of :username, :scope => :shop_id
end
