class SearchController < ApplicationController

  def index
    if params[:query].present?
      @jobs = Scrape.search(params[:query]).paginate(page: params[:page], per_page: 50)
      if Job.count > 0
        @rjh_jobs = Job.search(params[:query]).paginate(page: params[:page], per_page: 50)
        @job = Job.search(params[:query]).first
        if @job.nil?
          @job = Scrape.search(params[:query]).first
        end
      else
        @job = Scrape.search(params[:query]).first
      end
      render template: 'home_page/index'
    else
      redirect_to root_path
    end
  end

end
