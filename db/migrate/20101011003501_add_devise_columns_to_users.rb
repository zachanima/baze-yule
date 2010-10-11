class AddDeviseColumnsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :encrypted_password, :string, :limit => 128, :default => "", :null => false
    add_column :users, :password_salt, :string, :default => "", :null => false
    add_column :users, :sign_in_count, :integer, :default => 0
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string
    remove_column :users, :password
  end

  def self.down
    remove_column :users, :encrypted_password
    remove_column :users, :password_salt
    remove_column :users, :sign_in_count
    remove_column :users, :current_sign_in_at
    remove_column :users, :last_sign_in_at
    remove_column :users, :current_sign_in_ip
    remove_column :users, :last_sign_in_ip
    add_column :users, :password, :string
  end
end
