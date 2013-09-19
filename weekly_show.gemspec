$:.push File.expand_path("../lib", __FILE__)
require "weekly_show/version"

Gem::Specification.new do |s|
  s.name        = 'WeeklyShow'
  s.version     = WeeklyShow::VERSION 
  s.date        = '2013-09-20'
  s.summary     = "Weekly Show displays a calendar based on number of weeks."
  s.description = "Weekly Show displays a calendar based on number of weeks.  It is inspired by calendar_helper and later_dude."
  s.authors     = ["Alan Fung-Schwarz"]
  s.email       = 'alan@atomsign.net'
  s.files       = ["lib/weekly_show.rb"]
  s.homepage    = ''
  s.license     = 'MIT'

  s.add_dependency 'rails', '>= 3.2'
end
