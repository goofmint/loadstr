class ProfileAddToTwitterInformation < ActiveRecord::Migration
  def self.up
    add_column :profiles, :twitter_username, :string
    add_column :profiles, :twitter_auth, :string
  end

  def self.down
    remove_column :profiles, :twitter_username
    remove_column :profiles, :twitter_auth
  end
end
