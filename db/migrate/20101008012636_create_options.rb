class CreateOptions < ActiveRecord::Migration
  def self.up
    create_table :options do |t|
      t.string :text
      t.integer :option_group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :options
  end
end
