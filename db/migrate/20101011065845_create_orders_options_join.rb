class CreateOrdersOptionsJoin < ActiveRecord::Migration
  def self.up
    create_table :options_orders, :id => false do |t|
      t.references :option
      t.references :order
    end
  end

  def self.down
    drop_table :orders_variations
  end
end
