class AddLogoFileNameToShops < ActiveRecord::Migration
  def self.up
    add_column :shops, :logo_file_name, :string
  end

  def self.down
    remove_column :shops, :logo_file_name
  end
end
