class Admin::AdminController < ApplicationController
  
  before_filter :authenticate
  
  # 1. you must be logged in
  # 2. you must have administrator privileges
  
  private
    def authenticate
      authenticate_or_request_with_http_basic do |user_name, password| 
        user_name == "admin" && password == "admin"
      end
    end      
end
