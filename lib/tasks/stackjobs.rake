namespace :stackoverflow do
  task rails: :environment do
    require 'open-uri'
    require 'nokogiri'

      url = 'https://stackoverflow.com/jobs/feed?tl=ruby-on-rails'
      open(url) do |rss|
        feed = Nokogiri::XML(rss)
        feed.xpath('//item').each do |item|
          id = item.xpath('guid').text

          next if Scrape.exists?(job_id: id)

          begin
            title = item.xpath('title').text
            link = item.xpath('link').text
            company = item.xpath('a10:author').text
            skills = []
            item.xpath('category').each {|category| skills << category.text }
            date = DateTime.parse(item.xpath('pubDate').text).httpdate
            description = item.xpath('description').text
            source = 'StackOverflow'

            Scrape.create do |x|
              x.job_id = id
              x.title = title
              x.link = link
              x.date = date
              x.company = company
              # x.location = location
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

      # StackJob.where("created_at < ?", (Time.now - 10.minutes)).destroy_all
  end  #end task
end  #end namespace
