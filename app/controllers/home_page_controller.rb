class HomePageController < ApplicationController

  def index
    @github = Github.all
  end

  def show
    @id = params[:id]
    @model = params[:model]
    puts @id
    puts @model
    # @github = G
  end


end
