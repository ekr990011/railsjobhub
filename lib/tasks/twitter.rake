namespace :twitter do
  desc "Twitter"
  require 'twitter'

  # http://www.rubyguides.com/2016/04/twitter-api-from-ruby-tutorial/

  # client = Twitter::REST::Client.new do |config|
  #   config.consumer_key        = ENV["CONSUMER_KEY"]
  #   config.consumer_secret     = ENV["CONSUMER_SECRET"]
  #   config.access_token        = ENV["ACCESS_TOKEN"]
  #   config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
  # end

  task tweet: :environment do

    TwitterJob.new.perform

  end

  task railsjobhub: :environment do
      # RailsJobHub tweet
      array_railsjobhub = Array.new
      array_railsjobhub << 'Rails Job Hub agregating all the major job sites for Ruby on Rails, Ruby, and Web scraping job postings'
      array_railsjobhub << 'Rails Job Hub scrapes the major job sites hourly - saving developers time and aggrivation'
      array_railsjobhub << 'Rails Job Hub the developer friendly job site'
      array_railsjobhub << 'Rails Job Hub the Amazon of Rails developer job sites'

      random_number_railsjobhub = rand(0..3)
    pp railsjobhubtweet = array_railsjobhub[random_number_railsjobhub]
      client.update("#{railsjobhubtweet} https://goo.gl/A6Ulou")
  end

end
