namespace :twitter do
  desc "Twitter"
  task tweet: :environment do
    
    
   require 'twitter'
 
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["CONSUMER_KEY"]
  config.consumer_secret     = ENV["CONSUMER_SECRET"]
  config.access_token        = ENV["ACCESS_TOKEN"]
  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
end
    
    
    
    
    
    # Freelancer rails tweet
      array_freelancer_rails = Freelancerail.all
      
      random_number = rand(0..(Freelancerail.count - 1)) 
      select_tweet_freelancer_rails = "#{array_freelancer_rails[random_number].title}:  #{array_freelancer_rails[random_number].description}"
      truncated_tweet = select_tweet_freelancer_rails.truncate(110)
      
      # pp"#{select_tweet_freelancer_rails}"
      pp"#{truncated_tweet}"
      # client.update("#{select_tweet_freelancer_rails} https://goo.gl/pqZ8DF ")
      sleep(rand(3..15))
    
   
    # # Freelancer scrape tweet
      array_freelancer_scrape = Freelancescrape.all
      random_number_freelance_scrape = rand(0..(Freelancescrape.count -1))
      select_tweet_freelancer_scrape = "#{array_freelancer_scrape[random_number_freelance_scrape].title}:  #{array_freelancer_scrape[random_number_freelance_scrape].description}"
      truncated_tweet_freelancer_scrape = select_tweet_freelancer_scrape.truncate(110)
       
        pp"#{select_tweet_freelancer_scrape}"
        pp"#{truncated_tweet_freelancer_scrape}"
        client.update("#{truncated_tweet_freelancer_scrape} https://goo.gl/cYkSdC")
        sleep(rand(3..15))
       
     
      # Upwork rails tweet
      array_upwork_rails = UpworkRail.all
      random_number_upwork_rails = rand(0..(UpworkRail.count -1))
      select_tweet_upwork_rails = "#{array_upwork_rails[random_number_upwork_rails].title}:  #{array_upwork_rails[random_number_upwork_rails].description}"
      truncated_tweet_upwork_rails = select_tweet_upwork_rails.truncate(110)
       
        # pp"#{select_tweet_upwork_rails}"
        pp"#{truncated_tweet_upwork_rails}"
        client.update("#{truncated_tweet_upwork_rails} https://goo.gl/U2svdA")
        sleep(rand(3..15))
        
        
       # Upwork scrape tweet
      array_upwork_scrape = UpworkScrape.all
      random_number_upwork_scrape = rand(0..(UpworkScrape.count-1))
      select_tweet_upwork_scrape = "#{array_upwork_scrape[random_number_upwork_scrape].title}:  #{array_upwork_scrape[random_number_upwork_scrape].description}"
      truncated_tweet_upwork_scrape = select_tweet_upwork_scrape.truncate(110)
       
        # pp"#{select_tweet_upwork_scrape}"
        pp"#{truncated_tweet_upwork_scrape}"
        client.update("#{truncated_tweet_upwork_scrape} https://goo.gl/ioT3v8")
        sleep(rand(3..15))
        
        
       # Upwork ruby tweet
      array_upwork_ruby = UpworkRuby.all
      random_number_upwork_ruby = rand(0..(UpworkRuby.count-1))
      select_tweet_upwork_ruby = "#{array_upwork_ruby[random_number_upwork_ruby].title}:  #{array_upwork_ruby[random_number_upwork_ruby].description}"
      truncated_tweet_upwork_ruby = select_tweet_upwork_ruby.truncate(110)
       
        # pp"#{select_tweet_upwork_ruby}"
        pp"#{truncated_tweet_upwork_ruby}"
        client.update("#{truncated_tweet_upwork_ruby} https://goo.gl/OJzDtz")
        sleep(rand(3..15))
        
      
      # WeWorkRemotely tweet
      array_wework = WeworkRail.all
      random_number_wework = rand(0..(WeworkRail.count-1))
      select_tweet_wework = "#{array_wework[random_number_wework].company}:  #{array_wework[random_number_wework].description}"
      truncated_tweet_wework = select_tweet_wework.truncate(110)
       
        # pp"#{select_tweet_wework}"
        pp"#{truncated_tweet_wework}"
        client.update("#{truncated_tweet_wework} https://goo.gl/d0fvy1")
        sleep(rand(3..15))
       
       
      # Indeed tweet
      array_indeed = IndeedRail.all
      random_number_indeed = rand(0..(IndeedRail.count-1))
      select_tweet_indeed = "#{array_indeed[random_number_indeed].jobtitle}:  #{array_indeed[random_number_indeed].snippet}"
      truncated_tweet_indeed = select_tweet_indeed.truncate(110)
       
        # pp"#{select_tweet_indeed}"
        pp"#{truncated_tweet_indeed}"
        client.update("#{truncated_tweet_indeed} https://goo.gl/e7sJbU")
        sleep(rand(3..15))
      

      # StackJobs tweet
      array_stackjob = StackJob.all
      random_number_stackjob = rand(0..(StackJob.count-1))
      select_tweet_stackjob = "#{array_stackjob[random_number_stackjob].title}:  #{array_stackjob[random_number_stackjob].skills}"
      truncated_tweet_stackjob = select_tweet_stackjob.truncate(110)
       
        # pp"#{select_tweet_stackjob}"
        pp"#{truncated_tweet_stackjob}"
        client.update("#{truncated_tweet_stackjob} https://goo.gl/swR5PL")
        sleep(rand(3..15))



      # RailsJobHub tweet
      array_railsjobhub = Array.new
      array_railsjobhub << 'Rails Job Hub agregating all the major job sites for Ruby on Rails, Ruby, and Web scraping job postings'
      array_railsjobhub << 'Rails Job Hub scrapes the major job sites hourly - saving developers time and aggrivation' 
      array_railsjobhub << 'Rails Job Hub the developer friendly job site'
      array_railsjobhub << 'Rails Job Hub the Amazon of Rails developer job sites'
      
      random_number_railsjobhub = rand(0..3) 
      client.update("#{array_railsjobhub[random_number_railsjobhub]} https://goo.gl/A6Ulou")
    
      
  
  
  
  
  end



end
