class CreateVolunteers < ActiveRecord::Migration
  def self.up
    create_table :volunteers do |t|
      t.column :name, :string
      t.column :email, :string
      t.column :rider_id, :integer
    end
  end

  def self.down
    drop_table :volunteers
  end
end
