class FreelancerController < ApplicationController
  before_action :nav_bar
    
  def rails
    #need to find by hour from database
    @freelance_count = Freelancerail.count
    @freelance_half = @freelance_count / 2
    @freelancer_1 = Freelancerail.all[0...@freelance_half]
    @freelancer_2 = Freelancerail.all[@freelance_half..-1]
  end
  
  def scrape
    @freelance_count = Freelancescrape.count
    @freelance_half = @freelance_count / 2
    @freelancer_1 = Freelancescrape.all[0...@freelance_half]
    @freelancer_2 = Freelancescrape.all[@freelance_half..-1]
  end
  
  def main
  end
  
  
  private
  
  def nav_bar
    @nav_bar = 'layouts/nav'
  end
end
