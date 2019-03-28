class HomePageController < ApplicationController

  def index
    @github = Github.all
    @careerbuilder = Careerbuilder.all
    @cybercoder = Cybercoder.all
    @freelancerails = Freelancerail.all
    @freelancescrapes = Freelancescrape.all
    @indeedrails = IndeedRail.all
    @remotelyawesome = Remotelyawesome.all
    @stackjobs = StackJob.all
    @upworkrails = UpworkRail.all
    @upworkruby = UpworkRuby.all
    @upworkscrapes = UpworkScrape.all
    @weworkrails = WeworkRail.all
  end

end
