class TwitterJob
  include SuckerPunch::Job

  def perform
    require 'twitter'
    # http://www.rubyguides.com/2016/04/twitter-api-from-ruby-tutorial/

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
    end

    random_number = rand(20)
    selected_tweet = Scrape.first(20)[random_number]
    selected_truncated_tweet = "#{selected_tweet.title}: #{selected_tweet.company}".truncate(110)

    # pp"#{selected_tweet}"
    # pp"#{selected_truncated_tweet}"
    # pp "#{selected_truncated_tweet} http://www.railsjobhub.com?id=#{selected_tweet.id}"
    client.update("#{selected_truncated_tweet} http://www.railsjobhub.com?id=#{selected_tweet.job_id}")

  end
end
