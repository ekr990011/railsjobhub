class UpworkController < ApplicationController
  before_action :nav_bar
  
  def rails
    @location_tab = 'Rails:Upwork'
    #need to find by hour from database
    @upwork_count = UpworkRail.count
    @upwork_half = @upwork_count / 2
    @upworkrails_1 = UpworkRail.all[0...@upwork_half]
    @upworkrails_2 = UpworkRail.all[@upwork_half..-1]
  end
  
  def scrape
    @location_tab = 'Scrape:Upwork'
    @upwork_count = UpworkScrape.count
    @upwork_half = @upwork_count / 2
    @upworkscrape_1 = UpworkScrape.all[0...@upwork_half]
    @upworkscrape_2 = UpworkScrape.all[@upwork_half..-1]
  end
  
  def ruby
    @location_tab = 'Ruby:Upwork'
    @upwork_count = UpworkRuby.count
    @upwork_half = @upwork_count / 2
    @upworkruby_1 = UpworkRuby.all[0...@upwork_half]
    @upworkruby_2 = UpworkRuby.all[@upwork_half..-1]
  end
  
  private
  
  def nav_bar
    @nav_bar = 'layouts/nav'
  end
  
end
