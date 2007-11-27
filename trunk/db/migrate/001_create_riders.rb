class CreateRiders < ActiveRecord::Migration
  def self.up
    create_table :riders do |t|
      t.column :name, :string
      t.column :email, :string
      t.column :password, :string
      t.column :photo, :string # url
      t.column :lkhc_number, :integer
      t.column :team_id, :integer
      t.column :category_id, :integer
      t.column :gender, :string
      t.column :url, :string
      t.column :age, :string
      t.column :weight, :string
    end
  end

  def self.down
    drop_table :riders
  end
end
