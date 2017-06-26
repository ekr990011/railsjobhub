namespace :work do
  desc "TODO"
  task on: :environment do
    require 'mechanize'
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    
     @page = @a.get("https://weworkremotely.com/jobs/search?term=Ruby+on+Rails")
     
     @page2 = @a.get("https://weworkremotely.com" + @page.search('#category-2 > article > ul > li')[1].at('a').values.first)
     
     pp @page2.search('.listing-container').children.text.strip.truncate(500)
     
     
  end
end