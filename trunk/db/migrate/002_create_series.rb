class CreateSeries < ActiveRecord::Migration
  def self.up
    create_table :series do |t|
      t.column :year, :integer
      t.column :blurb, :text
    end
  end

  def self.down
    drop_table :series
  end
end
