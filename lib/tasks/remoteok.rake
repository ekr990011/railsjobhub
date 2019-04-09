namespace :remoteok do
  task rails: :environment do
    require 'open-uri'
    require 'nokogiri'

    url = 'https://remoteok.io/remote-ruby-jobs.rss'
    open(url) do |rss|
      feed = Nokogiri::XML(rss)
      feed.xpath('/rss/channel/item').each do |item|
        id = item.xpath('guid').text

        next if Scrape.exists?(job_id: id)

        begin
          title = item.xpath('title').text.strip
          company = item.xpath('company').text
          description = item.xpath('description').text
          skills = []
          skills << item.xpath('tags').text
          link = item.xpath('link').text
          date = DateTime.parse(item.xpath('pubDate').text).httpdate
          source = 'Remote Ok'

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

  end #end task
end #end namespace
