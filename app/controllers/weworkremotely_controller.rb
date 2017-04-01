class WeworkremotelyController < ApplicationController
  before_action :nav_bar
  
  def rails
    #need to find by hour from database
    @wework_count = WeworkRail.count
    @wework_half = @wework_count / 2
    @weworkrails_1 = WeworkRail.all[0...@wework_half]
    @weworkrails_2 = WeworkRail.all[@wework_half..-1]
  end
  
  
  private
  
  def nav_bar
    @nav_bar = 'layouts/nav'
  end
  
end
