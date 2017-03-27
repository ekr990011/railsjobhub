class UpworkController < ApplicationController
  
  def rails
    #need to find by hour from database
    @upwork_count = UpworkRail.count
    @upwork_half = @upwork_count / 2
    @upworkrails_1 = UpworkRail.all[0...@upwork_half]
    @upworkrails_2 = UpworkRail.all[@upwork_half..-1]
  end
  
end
