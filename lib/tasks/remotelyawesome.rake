namespace :remotelyawesome do
  desc "TODO"
  task rails: :environment do
    require 'mechanize'
    require 'json'
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    @page = @a.get('https://www.remotelyawesomejobs.com/remote-rails-jobs')
    
    @job_count = 0 
#    @job_count_total = @page.search('div.job > div.row > div.col-sm-9 > h2 > a').count
    @job_count_total = @page.search('div.jobs-container > ul > li').count
#    pp text =  @page.search('div.jobs-container > ul > li > div.job > h2 > a')[0].attr('href')
    
    pp "job count is #{@job_count_total}"

    while @job_count < 1 #@job_count_total
      puts @job_count
      @job_link = "https://www.remotelyawesomejobs.com" + @page.search('div.jobs-container > ul > li > div.job > h2 > a')[@job_count].attr('href')
#      puts "Job link #{@job_link}"
#      @job_skills = @page.search('div.jobs-container > ul > li > div.job > div.tags > div.tags >div.no-break >span.label > a').text
 #     pp @job_skills
      
      @job_page = @a.get(@job_link)
      
      @job_page
      
      
      
      @job_skill_array = []
      @job_page.search('.job-heading > .tags').children.each do |skill|
        unless skill.text.strip.length == 0
          @job_skill_array << skill.text.strip 
        end
      end      
      
      @job_title = @job_page.search('.job-heading > h1').text
      @job_company = @job_page.search('.job-heading > h2 > span').text
      @job_description = @job_page.search('.job-description').text.gsub("\n", '').truncate(500)

      # puts @job_title
      # puts @job_company
      # puts @job_description
      
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