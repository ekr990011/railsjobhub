class HomePageController < ApplicationController

  def index
    @github = Github.all
  end


end
