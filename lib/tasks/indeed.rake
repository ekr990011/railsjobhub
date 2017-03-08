namespace :indeed do
  desc "TODO"
  task rails: :environment do
    require 'mechanize'
    
    @a = Mechanize.new
    
    # &start for more page requests 25 per page, so &start=25 for pg2
    # @start for multiple results queing. 
    @start = 0
    @count = 0
    while @count < 2
      @page = @a.get("http://api.indeed.com/ads/apisearch?publisher=617637838187464&%20
      &q=Ruby+Rails&explvl=entry_level&sort=date&start=#{@start}&limit=25&latlong=1&co=us&userip=1.2.3.4
      &useragent=Mozilla/%2F4.0%28Firefox%29&v=2")
      
      @page.at('results').search('result').each do |job|
        @jobtitle = job.children.at('jobtitle').text
        @company = job.children.at('company').text
        @city = job.children.at('city').text
        @state = job.children.at('state').text
        @country = job.children.at('country').text
        @source = job.children.at('source').text
        @date = job.children.at('date').text
        @link = job.children.at('url').text
        @snippet = job.children.at('snippet').text
        
        IndeedRail.create do |x|
          x.jobtitle = @jobtitle
          x.company  = @company
          x.city     = @city
          x.state    = @state
          x.country  = @country
          x.source   = @source
          x.date     = @date
          x.link     = @link
          x.snippet  = @snippet
        end
      end
      
      @count += 1
      @start += 25
    end
    
    
    
  end
end
