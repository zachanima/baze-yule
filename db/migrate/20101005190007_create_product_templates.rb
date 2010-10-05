class CreateProductTemplates < ActiveRecord::Migration
  def self.up
    create_table :product_templates do |t|
      t.string :name
      t.string :identifier
      t.string :brand
      t.text :text

      t.timestamps
    end
  end

  def self.down
    drop_table :product_templates
  end
end
