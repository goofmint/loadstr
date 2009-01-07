class AddToMessage2Goal < ActiveRecord::Migration
  def self.up
    add_column :goals, :message2, :string
  end

  def self.down
    remove_column :goals, :message2
  end
end
