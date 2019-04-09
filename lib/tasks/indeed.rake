namespace :indeed do
  task rails: :environment do
    require 'mechanize'

    a = Mechanize.new
    a.user_agent_alias = 'Mac Safari 4'
    # enforced 25 results per page limit
    # start for more page requests 25 per page, so &start=25 for pg2
    # start for multiple results queing.
    start = 0
    count = 0
    while count < 3
      count += 1
      page = a.get("http://api.indeed.com/ads/apisearch?publisher=617637838187464&%20
      &q=Ruby+Rails&explvl=entry_level&sort=date&start=#{start}&limit=25&latlong=1&co=us&userip=1.2.3.4
      &useragent=Mozilla/%2F4.0%28Firefox%29&v=2")
      start += 25

      page.at('results').search('result').each do |job|
        id = job.children.at('jobkey').text

        next if Scrape.exists?(job_id: id)

        begin
          title = job.children.at('jobtitle').text
          company = job.children.at('company').text
          location = job.children.at('formattedLocationFull').text
          # indeed puts its own source from where the job came from
          # possibly grab this later
          # source = job.children.at('source').text
          date = DateTime.parse(job.children.at('date').text).httpdate
          link = job.children.at('url').text
          skills = ["Ruby on Rails"]
          source = "Indeed"

          page2 = a.get(link[/[^&]+/])
          description = page2.at('.jobsearch-JobComponent-description').inner_html

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
        end # end exception check
      end # end individual job
    end # end while loop

  end # end task
end # end namespace
