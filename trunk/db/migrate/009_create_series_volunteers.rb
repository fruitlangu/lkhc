class CreateSeriesVolunteers < ActiveRecord::Migration
  def self.up
    create_table :series_volunteers do |t|
      t.column :volunteer_id, :integer
      t.column :series_event_id, :integer
    end
  end

  def self.down
    drop_table :series_volunteers
  end
end
