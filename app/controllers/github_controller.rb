class GithubController < ApplicationController
   # before_action :nav_bar

  def rails
    @location_tab = 'Rails:Github'
    #need to find by hour from database

    #indeed likely to have  table cell data that should be looked at added/removed

    @github_count = Github.count
    @github_half = @github_count / 2
    @github_1 = Github.all[0...@github_half]
    @github_2 = Github.all[@github_half..-1]
  end

  def show
    puts params
    @github = Github.find_by_id(params[:id])
    render @github
  end


  private

  def nav_bar
    @nav_bar = 'layouts/nav'
  end
end
