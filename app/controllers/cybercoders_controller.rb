class CybercodersController < ApplicationController
  before_action :nav_bar 
  
  def rails
    @location_tab = 'Rails:CyberCoders'
    #need to find by hour from database
    
    #indeed likely to have  table cell data that should be looked at added/removed
    
    @cybercoder_count = Cybercoder.count
    @cybercoder_half = @cybercoder_count / 2
    @cybercoder_1 = Cybercoder.all[0...@cybercoder_half]
    @cybercoder_2 = Cybercoder.all[@cybercoder_half..-1]
  end
  
  
  private
  
  def nav_bar
    @nav_bar = 'layouts/nav'
  end
end
