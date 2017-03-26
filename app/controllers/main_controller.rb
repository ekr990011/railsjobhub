class MainController < ApplicationController
  
  def index
    #need to find by hour from database
    @freelance_count = Freelancerail.count
    @freelance_half = @freelance_count / 2
    @freelancer_1 = Freelancerail.all[0...@freelance_half]
    @freelancer_2 = Freelancerail.all[@freelance_half..-1]
  end
end
