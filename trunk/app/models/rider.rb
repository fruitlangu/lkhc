class Rider < ActiveRecord::Base
  belongs_to :category
  belongs_to :team
  has_many :series_event_results
  validates_uniqueness_of :lkhc_number
  
  def category_name
    unless (self.category.nil?)
      return self.category.name
    end
  end
  
  def team_name
    unless (self.team.nil?)
      return self.team.name
    end
  end
  
end
