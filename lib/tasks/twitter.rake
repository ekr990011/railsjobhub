namespace :twitter do
  desc "Twitter"
  task tweet: :environment do
    
    pp"111"
    
   require 'twitter'
 
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "cSJdhk2cI08FUwfvAujCF3uzP"
  config.consumer_secret     = "HGyJtcM4kITFERk3EaTCq343abUusYWsIkX54FPt1wZeO9yWjZ"
  config.access_token        = "849370429794004993-fD8TfISA3rVhi4TD9P3xrvwHqDEFIEQ"
  config.access_token_secret = "OWQk3AzBMyn6AUKSb0ztkVo4O0r1cabZNHXZa8RWwR8Qt"
end
    
    
    pp"The twitter bot is running"
    
    
    # Freelancer rails tweet
      array_freelancer_rails = Freelancerail.all
      select_tweet_freelancer_rails = array_freelancer_rails[rand(0..Freelancerail.count)].title
      pp"#{select_tweet_freelancer_rails}"
    
    
    
    
    client.update("#{select_tweet_freelancer_rails}")
    
   



  end   
end