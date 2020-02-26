class TwitterJob
  include SuckerPunch::Job

  def perform
    require 'twitter'
    # http://www.rubyguides.com/2016/04/twitter-api-from-ruby-tutorial/

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.credentials.twitter[:consumer_key]
      config.consumer_secret     = Rails.application.credentials.twitter[:consumer_secret]
      config.access_token        = Rails.application.credentials.twitter[:access_token]
      config.access_token_secret = Rails.application.credentials.twitter[:access_token_secret]
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
