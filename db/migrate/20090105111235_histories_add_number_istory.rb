class HistoriesAddNumberIstory < ActiveRecord::Migration
  def self.up
    add_column :histories, :before_number, :decimal, :scale => 2, :precision => 11
    add_column :histories, :after_number, :decimal, :scale => 2, :precision => 11
  end

  def self.down
    remove_column :histories, :before_number
    remove_column :histories, :after_number
  end
end
