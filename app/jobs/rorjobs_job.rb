class RorjobsJob
  include SuckerPunch::Job

  def perform
    require 'mechanize'

    a = Mechanize.new
    a.user_agent_alias = 'Mac Safari 4'
    page = a.get('https://www.rorjobs.com/')
    page.css('.jobList > .job-listing').each do |job|
      link = 'https://www.rorjobs.com/'
      link += job.at('.jobList-title').attr('href')
      id = link

      next if Scrape.exists?(job_id: id)

      begin
        source = "RoRJobs"
        title = job.at('.jobList-title').text
        company = job.css('.jobList-introMeta > li')[0].text.strip
        location = job.css('.jobList-introMeta > li')[1].text.strip
        date = DateTime.parse(job.at('.jobList-date').text).httpdate

        page2 = a.get(link)
        skills = ["Ruby on Rails"]
        page2.search('.u-mt--regular > ul > li').each do |skill|
          skills << skill.text
        end
        description = page2.search('.job-body').inner_html

        Scrape.create do |x|
          x.job_id = id
          x.title = title
          x.link = link
          x.date = date
          x.company = company
          x.location = location
          x.source = source
          x.skills = skills
          x.description = description
        end

      rescue
        puts "error in scrape"
        next
      end
    end
    
  end
end
