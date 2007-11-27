class CreateSeriesEventResults < ActiveRecord::Migration
  def self.up
    create_table :series_event_results do |t|
      t.column :rider_id, :integer
      t.column :series_event_id, :integer
      t.column :time_elapsed, :float
      t.column :rider_name, :string
      t.column :rider_team, :string
      t.column :rider_category, :string
      t.column :vam, :float
      t.column :speed, :float
      t.column :score, :float
    end
  end

  def self.down
    drop_table :series_event_results
  end
end
