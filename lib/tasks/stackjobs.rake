namespace :stackoverflow do
  task rails: :environment do
    require 'open-uri'
    require 'nokogiri'

      url = 'https://stackoverflow.com/jobs/feed?tl=ruby-on-rails'
      open(url) do |rss|
        feed = Nokogiri::XML(rss)
        feed.xpath('//item').each do |item|
        # item = feed.xpath('//item')[0]
          id = item.xpath('guid').text
          title = item.xpath('title').text
          link = item.xpath('link').text
          company = item.xpath('a10:author').text
          skills = []
          item.xpath('category').each {|category| skills << category.text }
          date = DateTime.parse(item.xpath('pubDate').text).httpdate
          description = item.xpath('description').text
          source = 'StackOverflow'

          # StackJob.create do |x|
          #   x.title = title
          #   x.link = link
          #   x.company = company
          #   x.skills = skills
          #   x.date_posted = date_posted
          #   x.description = description
          # end
        end
      end

      # StackJob.where("created_at < ?", (Time.now - 10.minutes)).destroy_all
  end  #end task
end  #end namespace
