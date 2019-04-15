class HomePageController < ApplicationController

  def index
    @jobs = Scrape.all.order(date: :desc)
    @job = Scrape.first
  end

  def show
    puts params
    @job = Scrape.find_by_id(params[:id])
    render partial: 'job_description'
  end

end
