namespace :work do
  desc "TODO"
  task onit: :environment do
    require 'mechanize'
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    
    @page = @a.get('https://www.freelancer.com/jobs/regions/?cl=l-en&keyword=webscrape')
    @rows = @page.search('#project-list > div') #each job row
      @count = 0
      while @rows[@count] != nil do
        @href = "https://www.freelancer.com" + @rows[@count].at('div.JobSearchCard-primary-heading > a').attr("href")  # href for job
        @title =  @rows[@count].at('div.JobSearchCard-primary-heading > a').children.text.strip
        @description = @rows[@count].at('div.JobSearchCard-primary > p').text.strip.tr("\n", "")
        @bids = @rows[@count].at('div.JobSearchCard-secondary > div.JobSearchCard-secondary-entry').text
        @skills = @rows[@count].at('div.JobSearchCard-primary > div.JobSearchCard-primary-tags').text.tr("\n", "").squeeze.strip
        @date = @rows[@count].at('div.JobSearchCard-primary > div.JobSearchCard-primary-heading > span').text
        @budget = @rows[@count].at('div.JobSearchCard-secondary > div.JobSearchCard-secondary-price').text.tr("\n", "").squeeze.strip
        
       
        Freelancerail.create do |x|
          x.href = @href
          x.title = @title
          x.description = @description
          x.bids = @bids
          x.skills = @skills
          x.date = @date
          x.budget = @budget
        end
        @count += 1
      end
      
  end
end
