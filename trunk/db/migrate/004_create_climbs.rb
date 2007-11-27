class CreateClimbs < ActiveRecord::Migration
  def self.up
    create_table :climbs do |t|
      t.column :title, :string
      t.column :location, :string
      t.column :max_altitude, :integer
      t.column :total_climbing, :integer
      t.column :average_gradient, :integer
      t.column :max_gradient, :integer
      t.column :distance, :integer
      t.column :blurb, :text
    end
  end

  def self.down
    drop_table :climbs
  end
end
