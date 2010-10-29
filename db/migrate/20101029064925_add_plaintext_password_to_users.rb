class AddPlaintextPasswordToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :plaintext_password, :string
  end

  def self.down
    remove_column :users, :plaintext_password
  end
end
