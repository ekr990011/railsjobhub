class GithubJob
  include SuckerPunch::Job

  def perform
    require 'mechanize'
    require 'json'

    a = Mechanize.new
    a.user_agent_alias = 'Mac Safari 4'
    page = a.get('https://jobs.github.com/positions.json?description=Rails')

    JSON.parse(page.body).each do |job|
      id = job['id']

      next if Scrape.exists?(job_id: id)

      begin
        date = DateTime.parse(job['created_at']).httpdate
        next if date < (Time.now - 30.days)

        title = job['title']
        link = job['url']
        description = job['description']
        company = job['company']
        location = job['location']
        source = 'Github'
        skills = ["Ruby on Rails"]

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
        puts 'error in scrape'
        next
      end
    end

  end
end
