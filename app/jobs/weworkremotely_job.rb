class WeworkremotelyJob
  include SuckerPunch::Job

  def perform
    require 'mechanize'

    a = Mechanize.new
    a.user_agent_alias = 'Mac Safari 4'
    page = a.get('https://weworkremotely.com/remote-jobs/search?utf8=%E2%9C%93&term=Ruby+on+Rails')
    rows = page.search('#category-2 > article > ul > li > a')
    row = 0
    while row < (rows.count - 2 )
      row += 1
      link = "https://weworkremotely.com" + rows[row].attr("href")
      id = link

      next if Scrape.exists?(job_id: id)

      begin
        company = rows[row].at('.company').text
        title = rows[row].at('.title').text

        page2 = a.get(link)
        date_unformated = page2.at('.listing-header-container > h3 > time').attr("datetime")
        date = DateTime.parse(date_unformated).httpdate
        location = page2.at(
          '.listing-header-container > h2 > .location').text.sub('Headquarters: ', '')
        description = page2.at('.listing-container').inner_html
        skills = ["Ruby on Rails"]
        source = "WeWorkRemotely"

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
        puts "an error occured during scrape"
        next
      end # end exception capture
    end # end while loop

  end
end
