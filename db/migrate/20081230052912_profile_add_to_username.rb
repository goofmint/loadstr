class ProfileAddToUsername < ActiveRecord::Migration
  def self.up
    add_column :profiles, :username, :string
  end

  def self.down
    remove_column :profiles, :username
  end
end
