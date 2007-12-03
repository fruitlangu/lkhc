# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_lkhc_session_id'
  
  def build_datetime_from_params(field_name, params)
    DateTime.new(params["#{field_name.to_s}(1i)"].to_i, 
             params["#{field_name.to_s}(2i)"].to_i, 
             params["#{field_name.to_s}(3i)"].to_i,
             params["#{field_name.to_s}(4i)"].to_i,
             params["#{field_name.to_s}(5i)"].to_i)
  end
  
  def build_date_from_params(field_name, params)
    DateTime.new(params["#{field_name.to_s}(1i)"].to_i, 
             params["#{field_name.to_s}(2i)"].to_i, 
             params["#{field_name.to_s}(3i)"].to_i)
  end
  
end
