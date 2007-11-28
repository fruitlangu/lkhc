# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 10) do

  create_table "categories", :force => true do |t|
    t.column "name", :string
    t.column "url",  :string
  end

  create_table "climbs", :force => true do |t|
    t.column "title",            :string
    t.column "location",         :string
    t.column "max_altitude",     :integer
    t.column "total_climbing",   :integer
    t.column "average_gradient", :integer
    t.column "max_gradient",     :integer
    t.column "distance",         :integer
    t.column "blurb",            :text
  end

  create_table "riders", :force => true do |t|
    t.column "name",        :string
    t.column "email",       :string
    t.column "password",    :string
    t.column "photo",       :string
    t.column "lkhc_number", :integer
    t.column "team_id",     :integer
    t.column "category_id", :integer
    t.column "gender",      :string
    t.column "url",         :string
    t.column "age",         :string
    t.column "weight",      :string
  end

  create_table "series", :force => true do |t|
    t.column "year",  :integer
    t.column "blurb", :text
  end

  create_table "series_event_results", :force => true do |t|
    t.column "rider_id",        :integer
    t.column "series_event_id", :integer
    t.column "time_elapsed",    :float
    t.column "rider_name",      :string
    t.column "rider_team",      :string
    t.column "rider_category",  :string
    t.column "vam",             :float
    t.column "speed",           :float
    t.column "score",           :float
  end

  create_table "series_events", :force => true do |t|
    t.column "series_id",          :integer
    t.column "climb_id",           :integer
    t.column "scheduled_date",     :date
    t.column "registration_start", :datetime
    t.column "registration_end",   :datetime
    t.column "event_start",        :datetime
    t.column "cost",               :float
    t.column "blurb",              :text
    t.column "coordinator",        :string
    t.column "staging_area_url",   :string
    t.column "week_number",        :integer
  end

  create_table "series_volunteers", :force => true do |t|
    t.column "volunteer_id",    :integer
    t.column "series_event_id", :integer
  end

  create_table "teams", :force => true do |t|
    t.column "name", :string
    t.column "url",  :string
  end

  create_table "volunteers", :force => true do |t|
    t.column "name",     :string
    t.column "email",    :string
    t.column "rider_id", :integer
  end

end
