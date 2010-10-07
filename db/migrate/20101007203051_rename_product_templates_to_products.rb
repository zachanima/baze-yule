class RenameProductTemplatesToProducts < ActiveRecord::Migration
  def self.up
    rename_table :product_templates, :products
  end

  def self.down
    rename_table :products, :product_templates
  end
end
