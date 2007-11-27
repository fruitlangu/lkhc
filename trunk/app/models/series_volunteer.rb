class SeriesVolunteer < ActiveRecord::Base
  belongs_to :series_event
  belongs_to :volunteer
end
