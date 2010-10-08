class AddProductIdToOptionGroups < ActiveRecord::Migration
  def self.up
    add_column :option_groups, :product_id, :integer
  end

  def self.down
    remove_column :option_groups, :product_id
  end
end
