namespace :freelance do
  desc "TODO"
  task rails: :environment do
    require 'mechanize'
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    @page = @a.get('https://www.freelancer.com/jobs/Ruby_on_Rails/1/?cl=l-en')
      @rows = @page.search('#project_table_static > tbody > tr') #each job row
      @count = 0
      # @rows[1].children[13].text.strip.sub(/\W*/, "")
      # 1,3,5,7,9,11,13
      while @rows[@count] != nil do
        @href = @rows[@count].children[1].at('a').first[1]  # href for job
        @title =  @rows[@count].children[1].text.strip
        @description = @rows[@count].children[3].text.strip
        @bids = @rows[@count].children[5].text.strip
        @skills = @rows[@count].children[7].text.strip
        @date_start = @rows[@count].children[9].text.strip
        @date_finish =  @rows[@count].children[11].text.strip.sub("Today", "")
        @budget = @rows[@count].children[13].text.strip
        
       
        Freelancerail.create do |x|
          x.href = @href
          x.title = @title
          x.description = @description
          x.bids = @bids
          x.skills = @skills
          x.date_start = @date_start
          x.date_finish = @date_finish
          x.budget = @budget
        end
        @count += 1
      end
      
      
    @page = @a.get('https://www.freelancer.com/jobs/Ruby_on_Rails/1/?cl=l-en&pg=2')
    @rows = @page.search('#project_table_static > tbody > tr')
    @count = 0
      while @rows[@count] != nil do
      @href = @rows[@count].children[1].at('a').first[1]  # href for job
      @title =  @rows[@count].children[1].text.strip
      @description = @rows[@count].children[3].text.strip
      @bids = @rows[@count].children[5].text.strip
      @skills = @rows[@count].children[7].text.strip
      @date_start = @rows[@count].children[9].text.strip
      @date_finish =  @rows[@count].children[11].text.strip.sub("Today", "")
      @budget = @rows[@count].children[13].text.strip
      # 
      @count += 1
      
       Freelancerail.create do |x|
        x.href = @href
        x.title = @title
        x.description = @description
        x.bids = @bids
        x.skills = @skills
        x.date_start = @date_start
        x.date_finish = @date_finish
        x.budget = @budget
       end
      end
     Freelancerail.where("created_at < ?", (Time.now - 10.minutes)).destroy_all
  
  end
  
  
  
  task scrape: :environment do
    
    require 'mechanize'
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    @page = @a.get('https://www.freelancer.com/jobs/Web_Scraping/1/?cl=l-en')
      @rows = @page.search('#project_table_static > tbody > tr')
      @count = 0
      pp# @rows[1].children[13].text.strip.sub(/\W*/, "")
      # 1,3,5,7,9,11,13
      while @rows[@count] != nil do
       @href = @rows[@count].children[1].at('a').first[1]  # href for job
       @title =  @rows[@count].children[1].text.strip
       @description = @rows[@count].children[3].text.strip
       @bids = @rows[@count].children[5].text.strip
       @skills = @rows[@count].children[7].text.strip
       @date_start = @rows[@count].children[9].text.strip
       @date_finish =  @rows[@count].children[11].text.strip.sub("Today", "")
       @budget = @rows[@count].children[13].text.strip
       
       
      Freelancescrape.create do |x|
        x.href = @href
        x.title = @title
        x.description = @description
        x.bids = @bids
        x.skills = @skills
        x.date_start = @date_start
        x.date_finish = @date_finish
        x.budget = @budget
      end
       @count += 1
      end
    @page = @a.get('https://www.freelancer.com/jobs/Web_Scraping/1/?cl=l-en&pg=2')
    @rows = @page.search('#project_table_static > tbody > tr')
    @count = 0
      while @rows[@count] != nil do
      @href = @rows[@count].children[1].at('a').first[1]  # href for job
      @title =  @rows[@count].children[1].text.strip
      @description = @rows[@count].children[3].text.strip
      @bids = @rows[@count].children[5].text.strip
      @skills = @rows[@count].children[7].text.strip
      @date_start = @rows[@count].children[9].text.strip
      @date_finish =  @rows[@count].children[11].text.strip.sub("Today", "")
      @budget = @rows[@count].children[13].text.strip
      
      
       Freelancescrape.create do |x|
        x.href = @href
        x.title = @title
        x.description = @description
        x.bids = @bids
        x.skills = @skills
        x.date_start = @date_start
        x.date_finish = @date_finish
        x.budget = @budget
       end
      @count += 1
      end
      Freelancescrape.where("created_at < ?", (Time.now - 10.minutes)).destroy_all
   end
  
end
