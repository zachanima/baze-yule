class RemoveNameFromOptionGroups < ActiveRecord::Migration
  def self.up
    remove_column :option_groups, :name
  end

  def self.down
    add_column :option_groups, :name, :string
  end
end
