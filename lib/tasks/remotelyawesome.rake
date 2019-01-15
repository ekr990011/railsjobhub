namespace :remotelyawesome do
  task rails: :environment do
    require 'mechanize'
    require 'json'
    
    a = Mechanize.new
    a.user_agent_alias = 'Mac Safari 4'
    puts "mech agent setup"
    page = a.get('https://www.remotelyawesomejobs.com/remote-rails-jobs')
    puts "page has been successfully traveled to"
    
    job_count = 0 
    job_count_total = page.search('div.jobs-container > ul > li').count
    while job_count < job_count_total
      ref_link = page.search('div.jobs-container > ul > li > div.job > h2 > a')[job_count].attr('href')
      if ref_link.slice(0) != "h"
        job_link = "https://www.remotelyawesomejobs.com" + page.search('div.jobs-container > ul > li > div.job > h2 > a')[job_count].attr('href')
  
        job_page = a.get(job_link)
        
        job_skill_array = []
        job_page.search('.job-heading > .tags').children.each do |skill|
          unless skill.text.strip.length == 0
            job_skill_array << skill.text.strip 
          end
        end      
        
        job_title = job_page.search('.job-heading > h1').text
        job_company = job_page.search('.job-heading > h2 > span').text
        job_description = job_page.search('.job-description').text.gsub("\n", '').truncate(500)
  
        Remotelyawesome.create do |x|
          x.job_link = job_link
          x.job_skills = job_skill_array
          x.job_title = job_title
          x.job_company = job_company
          x.job_description = job_description
        end
        
      end
      job_count += 1
    end
    Remotelyawesome.where("created_at < ?", (Time.now - 10.minutes)).destroy_all
  end
end