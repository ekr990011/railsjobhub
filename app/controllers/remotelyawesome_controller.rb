class RemotelyawesomeController < ApplicationController
   before_action :nav_bar
  
  def rails
    @location_tab = 'RemotelyAwesome'
    #need to find by hour from database
    @remotelyawesome_count = Remotelyawesome.count
    @remotelyawesome_half = @remotelyawesome_count / 2
    @remotelyawesome_1 = Remotelyawesome.all[0...@remotelyawesome_half]
    @remotelyawesome_2 = Remotelyawesome.all[@remotelyawesome_half..-1]
  end
  
  
  private
  
  def nav_bar
    @nav_bar = 'layouts/nav'
  end
  
  
  
  
  
end
