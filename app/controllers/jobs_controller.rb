class JobsController < ApplicationController
  before_action :trix, only: [:new, :show, :create]
  before_action :nofollow, only: [:new, :create, :edit, :update, :show]
  before_action :g_ads

  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])
    render partial: 'home_page/job_description'
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      skills = []
      skills_pre = job_params[:skills].split(',')
      skills_pre.each { |x| skills << x.strip }
      @job.update(skills: skills, source: "RailsJobHub",
        date: Time.now.utc, job_id: @job.id)
      session[:job_id] = @job.id
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def job_params
    params.require(:job).permit(:title, :description, :email, :link,
                                :location, :price, :company, :skills)
  end

  def trix
    @trix = true
  end

  def nofollow
    @nofollow = 1
  end

  def g_ads
    @g_ads = false
  end
end
