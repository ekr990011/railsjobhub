class StackjobsController < ApplicationController
  before_action :nav_bar
  
  def rails
    @location_tab = 'Rails:StackOverflow'
    #need to find by hour from database
    @stackjobs_count = StackJob.count
    @stackjobs_half = @stackjobs_count / 2
    @stackjobsrails_1 = StackJob.all[0...@stackjobs_half]
    @stackjobsrails_2 = StackJob.all[@stackjobs_half..-1]
  end
  
  private
  
  def nav_bar
    @nav_bar = 'layouts/nav'
  end
  
end
