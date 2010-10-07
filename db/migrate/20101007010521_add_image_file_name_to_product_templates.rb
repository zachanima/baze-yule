class AddImageFileNameToProductTemplates < ActiveRecord::Migration
  def self.up
    add_column :product_templates, :image_file_name, :string
  end

  def self.down
    remove_column :product_templates, :image_file_name
  end
end
