class CreateHistories < ActiveRecord::Migration
  def self.up
    create_table :histories do |t|
      t.integer :goal_id
      t.date    :history_at
      t.string :message
      t.decimal :number, :scale => 2
      t.integer :style
      t.timestamps
    end
  end

  def self.down
    drop_table :histories
  end
end
