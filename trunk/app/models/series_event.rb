class SeriesEvent < ActiveRecord::Base
  belongs_to :climb
  belongs_to :series
  has_many :series_volunteers
end
