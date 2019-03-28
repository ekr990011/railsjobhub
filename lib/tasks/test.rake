namespace :testy do
  task test: :environment do
    require 'mechanize'

    a = Mechanize.new
    a.user_agent_alias = 'Mac Safari 4'
    page = a.get('https://weworkremotely.com/remote-jobs/search?utf8=%E2%9C%93&term=Ruby+on+Rails')
    rows = page.search('#category-2 > article > ul > li > a')
    row = 0
    # while row < (rows.count - 1 )
      link = "https://weworkremotely.com" + rows[row].attr("href") #link rel href
      company = rows[row].at('.company').text
      title = rows[row].at('.title').text
      puts link
      puts company
      puts title

      page2 = a.get(link)
      date_unformated = page2.at('.listing-header-container > h3 > time').attr("datetime")
      date = DateTime.parse(date_unformated).httpdate
      description = page2.at('.listing-container').inner_html
      puts date
      # puts description
  #     WeworkRail.create do |x|
  #      x.company = company
  #      x.description = description
  #      x.date = date
  #      x.link = link
  #      x.descriptionlong = description_long
  #     end #end database creation
  #   row += 1
    # end #end while outer
  #
  # WeworkRail.where("created_at < ?", (Time.now - 10.minutes)).destroy_all
  end #end task
end #end namespace
