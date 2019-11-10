class HomePageController < ApplicationController
  before_action :g_ads

  def index
    if params[:page].to_i > 1
      @jobs = Scrape.paginate(page: params[:page], per_page: 50)
      if Job.count > 0
        @rjh_jobs = Job.all.paginate(page: params[:page], per_page: 50)
        @job = Job.first
      else
        @job = Scrape.first
      end
      render partial: 'job_meta'
    elsif params[:id]
      @job = Scrape.find_by(job_id: params[:id])
      @jobs = Scrape.where.not(job_id: params[:id]).first(50)
      if Job.count > 0
        @rjh_jobs = Job.first(50)
        if @job
          @rjh_jobs.to_a.prepend(@job)
        else
          @job = @rjh_jobs.first
        end
      else
        if @job
          @jobs.to_a.prepend(@job)
        else
          @job = @jobs.first
        end
      end
    else
      @jobs = Scrape.paginate(page: params[:page], per_page: 50)
      if Job.count > 0
        @rjh_jobs = Job.all.paginate(page: params[:page], per_page: 50)
        @job = Job.first
      else
        @job = Scrape.first
      end
    end
  end

  def show
    puts params
    @job = Scrape.find_by_id(params[:id])
    render partial: 'job_description'
  end

  private

  def g_ads
    @g_ads = true
  end

end
