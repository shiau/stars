class AddPasswordToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :password, :string, :default => nil
  end

  def self.down
    remove_column :users, :password
  end
end
