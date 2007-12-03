#!/usr/bin/env ruby

require File.join(File.dirname(__FILE__), '..', 'config', 'boot')
require File.join(File.dirname(__FILE__), '..', 'config', 'environment')
require 'csv'

if ARGV[0].nil? or not File.exists?(ARGV[0])
  puts "Need a valid file to work with"
  exit 1
end

count = 0
CSV::Reader.parse(File.open(ARGV[0], 'rb')) do |row|
  count += 1
  number, name, gender, category, team = row
  next if number !~ /^\d+$/
  if Rider.find_by_lkhc_number(number).nil?
    
    r = Rider.new
    r.name = name
    r.lkhc_number = number
    if (gender.nil?)
      r.gender = "Unknown"
    else
      r.gender = (gender =~ /m/i ? "Male" : "Female")
    end
    
    r.category = Category.find_or_create_by_name(category) unless category.nil?
    r.team = Team.find_or_create_by_name(team) unless team.nil?
    r.save
    
    puts "Created rider #{name} (##{number})"
    
  end
end