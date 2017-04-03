namespace :upwork do
  desc "TODO"
  task rails: :environment do
    require 'mechanize'
   
   # run for entry level rails jobs
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    @page = @a.get('https://www.upwork.com/ab/feed/jobs/rss?contractor_tier=1&q=Ruby+on+Rails&sort=create_time+desc&api_params=1') 
    @rows = @page.search('item')
    @row = 0
    while @row < @rows.count
      @title = @rows[@row].elements.children[0].text.sub(" - Upwork", "") #title
      @link = @rows[@row].elements.children[1].text #link
      @description = @rows[@row].elements.children[2].text.gsub(/\<.*\>/, " ").gsub(/\n/, "") #description
      @date = @rows[@row].elements.children[4].text.gsub(/ \+0000/, "")
      
      UpworkRail.create do |x|
        x.title = @title
        x.href = @link
        x.description = @description
        x.date = @date
      end
      @row += 1
    end
  end
    
  task scrape: :environment do
  require 'mechanize'
  
  #run a entry level scrape jobs
  @a = Mechanize.new
  @a.user_agent_alias = 'Mac Safari 4'
  @page = @a.get('https://www.upwork.com/ab/feed/jobs/rss?contractor_tier=1&q=Web+scraping&sort=create_time+desc&api_params=1')
  @rows = @page.search('item')
  @row = 0
    while @row < @rows.count
      @title = @rows[@row].elements.children[0].text #title
      @link = @rows[@row].elements.children[1].text #link
      @description = @rows[@row].elements.children[2].text.gsub(/\<.*\>/, " ").gsub(/\n/, "") #description
      @date = @rows[@row].elements.children[4].text.gsub(/ \+0000/, "")
      
      UpworkScrape.create do |x|
        x.title = @title
        x.href = @link
        x.description = @description
        x.date = @date
      end
      @row += 1
    end
  end
  
  task ruby: :environment do
  require 'mechanize'
  
  #run an entry level ruby jobs
  @a = Mechanize.new
  @a.user_agent_alias = 'Mac Safari 4'
  @page = @a.get('https://www.upwork.com/ab/feed/jobs/rss?contractor_tier=1&q=Ruby&sort=create_time+desc&api_params=1')
  @rows = @page.search('item')
  @row = 0
    while @row < @rows.count
      @title = @rows[@row].elements.children[0].text #title
      @link = @rows[@row].elements.children[1].text #link
      @description = @rows[@row].elements.children[2].text.gsub(/\<.*\>/, " ").gsub(/\n/, "") #description
      @date = @rows[@row].elements.children[4].text.gsub(/ \+0000/, "")
      
      UpworkRuby.create do |x|
        x.title = @title
        x.href = @link
        x.description = @description
        x.date = @date
      end
      @row += 1
    end
  end
    
end