class CreateShops < ActiveRecord::Migration
  def self.up
    create_table :shops do |t|
      t.string :name
      t.string :slug
      t.string :username_text
      t.string :password_text
      t.text :text
      t.date :opens_on
      t.date :closes_on

      t.timestamps
    end
  end

  def self.down
    drop_table :shops
  end
end
