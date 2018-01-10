namespace :remotelyawesome do
  desc "TODO"
  task rails: :environment do
    require 'mechanize'
    require 'json'
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    @page = @a.get('https://www.remotelyawesomejobs.com/remote-rails-jobs')
    
    @job_count = 0 
    @job_count_total = @page.search('div.job > div.row > div.col-sm-9 > h2 > a').count
    
    while @job_count < @job_count_total
      @job_link = "https://www.remotelyawesomejobs.com" + @page.search('div.job > div.row > div.col-sm-9 > h2 > a')[@job_count].attr("href")
      @job_page = @a.get(@job_link)
      
      @job_skill_array = []
      @job_skills = @job_page.search('.job-heading > div.tags > div.no-break > span > a').each do |skill|
        @job_skill_array << skill.text 
      end
      @job_title = @job_page.search('.job-heading > h1').text
      @job_company = @job_page.search('.job-heading > h2 > span').text
      @job_description = @job_page.search('.job-description').text.gsub("\n", '').truncate(500)
      
      Remotelyawesome.create do |x|
        x.job_link = @job_link
        x.job_skills = @job_skill_array
        x.job_title = @job_title
        x.job_company = @job_company
        x.job_description = @job_description
      end
      
      @job_count += 1
    end
    Remotelyawesome.where("created_at < ?", (Time.now - 10.minutes)).destroy_all
  end
end