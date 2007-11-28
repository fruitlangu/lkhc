class AddWeek < ActiveRecord::Migration
  def self.up
    add_column :series_events, :week_number, :integer
  end

  def self.down
    remove_column :series_events, :week_number
  end
end
