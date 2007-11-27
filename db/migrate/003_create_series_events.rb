class CreateSeriesEvents < ActiveRecord::Migration
  def self.up
    create_table :series_events do |t|
      t.column :series_id, :integer
      t.column :climb_id, :integer
      t.column :scheduled_date, :date
      t.column :registration_start, :datetime
      t.column :registration_end, :datetime
      t.column :event_start, :date
      t.column :cost, :float
      t.column :blurb, :text
      t.column :coordinator, :string
      t.column :staging_area_url, :string
    end
  end

  def self.down
    drop_table :series_events
  end
end
