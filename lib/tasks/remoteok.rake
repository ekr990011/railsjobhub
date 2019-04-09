namespace :remoteok do
  task rails: :environment do
    require 'open-uri'
    require 'nokogiri'

    url = 'https://remoteok.io/remote-ruby-jobs.rss'
    open(url) do |rss|
      feed = Nokogiri::XML(rss)
      feed.xpath('/rss/channel/item').each do |item|
        title = item.xpath('title').text.strip
        id = item.xpath('guid').text
        company = item.xpath('company').text
        description = item.xpath('description').text
        skills = []
        skills << item.xpath('tags').text
        link = item.xpath('link').text
        date = DateTime.parse(item.xpath('pubDate').text).httpdate
        source = 'Remote Ok'
      end
    end

  end #end task
end #end namespace
