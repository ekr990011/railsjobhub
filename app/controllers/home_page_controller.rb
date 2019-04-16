class HomePageController < ApplicationController

  def index
    puts params
    if params[:page].to_i > 1
      @jobs = Scrape.paginate(page: params[:page], per_page: 5)
      puts @jobs.count
      @job = Scrape.first
      render partial: 'job_meta'
    else
      @jobs = Scrape.paginate(page: params[:page], per_page: 5)
      @job = Scrape.first
    end
  end

  def show
    puts params
    @job = Scrape.find_by_id(params[:id])
    render partial: 'job_description'
  end

end
