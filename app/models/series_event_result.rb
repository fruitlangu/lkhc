class SeriesEventResult < ActiveRecord::Base
  belongs_to :series_event
  belongs_to :rider
end
