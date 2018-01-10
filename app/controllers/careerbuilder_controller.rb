class CareerbuilderController < ApplicationController
  before_action :nav_bar 
  
  def rails
    @location_tab = 'Rails:CareerBuilder'
    #need to find by hour from database
    
    #indeed likely to have  table cell data that should be looked at added/removed
    
    @careerbuilder_count = Careerbuilder.count
    @careerbuilder_half = @careerbuilder_count / 2
    @careerbuilder_1 = Careerbuilder.all[0...@careerbuilder_half]
    @careerbuilder_2 = Careerbuilder.all[@careerbuilder_half..-1]
  end
  
  
  private
  
  def nav_bar
    @nav_bar = 'layouts/nav'
  end
end