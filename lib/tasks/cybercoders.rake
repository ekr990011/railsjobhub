namespace :cybercoders do
  task rails: :environment do
    require 'mechanize'
    
    a = Mechanize.new
    a.user_agent_alias = 'Mac Safari 4'
    page = a.get('https://www.cybercoders.com/search/?searchterms=ruby%20rails&searchlocation=&newsearch=true&originalsearch=true&sorttype=date')
    
    
    multiple_page_count = page.search('div.job-listing-container > div.job-listing-item > div.job-details-container > div.job-title').count
    page_count = 0
    
    while page_count < multiple_page_count
      multiple_pages_link = "https://www.cybercoders.com" + page.search(' div.job-listing-container > div.job-listing-item > div.job-details-container > div.job-title')[page_count].children.at('a').attr("href")
      
      job_page = a.get("#{multiple_pages_link}")
      
      job_title = job_page.search('div.job-info-content > div.job-info-title > div > h1').text
      job_location = job_page.search('div.job-details-header > div > div.job-info-content > div.job-info-main').children[1].children[2].text
      job_wage = job_page.search('div.job-details-header > div > div.job-info-content > div.job-info-main').children[3].children[1].text
      job_time = job_page.search('div.job-details-header > div > div.job-info-content > div.job-info-main').children[5].children[1].text
    
      job_skill_array = []
      job_page.search('div.skills-section > div > ul > li > a > span.skill-name').each do |skill|
        job_skill_array << skill.text
      end  
      
      job_description = job_page.search('div.job-details > div.section-data').first.text.truncate(500)
      
      Cybercoder.create do |x|
        x.job_link = multiple_pages_link
        x.job_title = job_title
        x.job_location = job_location
        x.job_wage = job_wage
        x.job_time = job_time
        x.job_skill_array = job_skill_array
        x.job_description = job_description
      end
      
      
      page_count += 1
    end
    
    Cybercoder.where("created_at < ?", (Time.now - 10.minutes)).destroy_all
  end
end