class IndeedController < ApplicationController
  before_action :nav_bar 
  
  def rails
    @location_tab = 'Rails:Indeed'
    #need to find by hour from database
    
    #indeed likely to have  table cell data that should be looked at added/removed
    
    @indeed_count = IndeedRail.count
    @indeed_half = @indeed_count / 2
    @indeedrails_1 = IndeedRail.all[0...@indeed_half]
    @indeedrails_2 = IndeedRail.all[@indeed_half..-1]
  end
  
  private
  
  def nav_bar
    @nav_bar = 'layouts/nav'
  end
  
end
