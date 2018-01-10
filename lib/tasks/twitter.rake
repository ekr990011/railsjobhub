namespace :twitter do
  desc "Twitter"
 
    
    
   require 'twitter'
 
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["CONSUMER_KEY"]
  config.consumer_secret     = ENV["CONSUMER_SECRET"]
  config.access_token        = ENV["ACCESS_TOKEN"]
  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
end
    
    
    
    
  task freelancerails: :environment do
    # Freelancer rails tweet
      array_freelancer_rails = Freelancerail.all
      
      max = [5, Freelancerail.count - 1].min
      
      random_number = rand(0..max) 
      select_tweet_freelancer_rails = "#{array_freelancer_rails[random_number].title}:  #{array_freelancer_rails[random_number].description}"
      truncated_tweet = select_tweet_freelancer_rails.truncate(110)
      
      # pp"#{select_tweet_freelancer_rails}"
      pp"#{truncated_tweet}" 
      pp "freelancerrails"
       client.update("#{truncated_tweet} https://goo.gl/pqZ8DF")
  end
    
  task freelancescrape: :environment do
    # # Freelancer scrape tweet
      array_freelancer_scrape = Freelancescrape.all
      
      max = [5, Freelancescrape.count - 1].min
      
      random_number_freelance_scrape = rand(0..(max))
      select_tweet_freelancer_scrape = "#{array_freelancer_scrape[random_number_freelance_scrape].title}:  #{array_freelancer_scrape[random_number_freelance_scrape].description}"
      truncated_tweet_freelancer_scrape = select_tweet_freelancer_scrape.truncate(110)
       
        
        pp"#{truncated_tweet_freelancer_scrape}"
        pp "freelancerscrape"
        client.update("#{truncated_tweet_freelancer_scrape} https://goo.gl/cYkSdC")
  end
       
     
  task upworkrails: :environment do   
      # Upwork rails tweet
      array_upwork_rails = UpworkRail.all
      
      max = [5, UpworkRail.count - 1].min
      
      random_number_upwork_rails = rand(0..(max))
      select_tweet_upwork_rails = "#{array_upwork_rails[random_number_upwork_rails].title}:  #{array_upwork_rails[random_number_upwork_rails].description}"
      truncated_tweet_upwork_rails = select_tweet_upwork_rails.truncate(110)
       
        # pp"#{select_tweet_upwork_rails}"
        pp"#{truncated_tweet_upwork_rails}"
        pp "upworkrails"
        client.update("#{truncated_tweet_upwork_rails} https://goo.gl/U2svdA")
  end
        
        
  task upworkscrape: :environment do
      # Upwork scrape tweet
      array_upwork_scrape = UpworkScrape.all
      
       max = [5, UpworkScrape.count - 1].min
      
      random_number_upwork_scrape = rand(0..(max))
      select_tweet_upwork_scrape = "#{array_upwork_scrape[random_number_upwork_scrape].title}:  #{array_upwork_scrape[random_number_upwork_scrape].description}"
      truncated_tweet_upwork_scrape = select_tweet_upwork_scrape.truncate(110)
       
        # pp"#{select_tweet_upwork_scrape}"
        pp"#{truncated_tweet_upwork_scrape}"
        pp "upworkscrape"
        client.update("#{truncated_tweet_upwork_scrape} https://goo.gl/ioT3v8")
  end
        
        
  task upworkruby: :environment do
      # Upwork ruby tweet
      array_upwork_ruby = UpworkRuby.all
      
       max = [5, UpworkRuby.count - 1].min
      
      random_number_upwork_ruby = rand(0..(max))
      select_tweet_upwork_ruby = "#{array_upwork_ruby[random_number_upwork_ruby].title}:  #{array_upwork_ruby[random_number_upwork_ruby].description}"
      truncated_tweet_upwork_ruby = select_tweet_upwork_ruby.truncate(110)
       
        # pp"#{select_tweet_upwork_ruby}"
        pp"#{truncated_tweet_upwork_ruby}"
        pp "upworkruby"
        client.update("#{truncated_tweet_upwork_ruby} https://goo.gl/OJzDtz")
  end
        
      
  task weworkremotely: :environment do
      # WeWorkRemotely tweet
      array_wework = WeworkRail.all
      
       max = [5, WeworkRail.count - 1].min
      
      random_number_wework = rand(0..(max))
      select_tweet_wework = "#{array_wework[random_number_wework].company}:  #{array_wework[random_number_wework].description}"
      truncated_tweet_wework = select_tweet_wework.truncate(110)
       
        # pp"#{select_tweet_wework}"
        pp"#{truncated_tweet_wework}"
        pp "weworkremotely"
        client.update("#{truncated_tweet_wework} https://goo.gl/d0fvy1")
  end      
       
       
  task indeed: :environment do
      # Indeed tweet
      array_indeed = IndeedRail.all
      
       max = [5, IndeedRail.count - 1].min
      
      random_number_indeed = rand(0..(max))
      select_tweet_indeed = "#{array_indeed[random_number_indeed].jobtitle}:  #{array_indeed[random_number_indeed].snippet}"
      truncated_tweet_indeed = select_tweet_indeed.truncate(110)
       
        # pp"#{select_tweet_indeed}"
        pp"#{truncated_tweet_indeed}"
        pp "indeed"
        client.update("#{truncated_tweet_indeed} https://goo.gl/e7sJbU")
 end
      

  task stackjob: :environment do
      # StackJobs tweet
      array_stackjob = StackJob.all
      
       max = [5, StackJob.count - 1].min
      
      random_number_stackjob = rand(0..(max))
      select_tweet_stackjob = "#{array_stackjob[random_number_stackjob].title}:  #{array_stackjob[random_number_stackjob].skills}"
      truncated_tweet_stackjob = select_tweet_stackjob.truncate(110)
       
        # pp"#{select_tweet_stackjob}"
        pp"#{truncated_tweet_stackjob}"
        pp "stackjob"
        client.update("#{truncated_tweet_stackjob} https://goo.gl/swR5PL")
  end
  
  
  task github: :environment do
      # github tweet
      array_github = Github.all
      
       max = [5, Github.count - 1].min
      
      random_number_github = rand(0..(max))
      select_tweet_github = "#{array_github[random_number_github].job_title}:  #{array_github[random_number_github].job_description}"
      truncated_tweet_github = select_tweet_github.truncate(110)
       
        # pp"#{select_tweet_stackjob}"
        pp"#{truncated_tweet_github}"
        pp "github"
        client.update("#{truncated_tweet_stackjob} https://goo.gl/gWf334")
  end
        
        
  task careerbuilder: :environment do
         # careerbuilder tweet
      array_careerbuilder =  Careerbuilder.all
      
       max = [5, Careerbuilder.count - 1].min
      
      random_number_careerbuilder= rand(0..(max))
      select_tweet_careerbuilder = "#{array_careerbuilder[random_number_careerbuilder].job_title}: #{array_careerbuilder[random_number_careerbuilder].job_description}"
      truncated_tweet_careerbuilder = select_tweet_careerbuilder.truncate(110)
       
        # pp"#{select_tweet_careerbuilder}"
        pp"#{truncated_tweet_careerbuilder}"
        pp "careerbuilder"
        client.update("#{truncated_tweet_careerbuilder} https://goo.gl/Y5iZBD")
  end
        
        
        
  task cybercoder: :environment do
          # cybercoders tweet
      array_cybercoder =  Cybercoder.all
      
       max = [5, Cybercoder.count - 1].min
      
      random_number_cybercoder = rand(0..(max))
      select_tweet_cybercoder = "#{array_cybercoder[random_number_cybercoder].job_title}:  #{array_cybercoder[random_number_cybercoder].job_description}"
      truncated_tweet_cybercoder = select_tweet_cybercoder.truncate(110)
       
        # pp"#{select_tweet_cybercoder}"
        pp"#{truncated_tweet_cybercoder}"
        pp "cybercoder"
        client.update("#{truncated_tweet_cybercoder} https://goo.gl/YGyXdJ")
  end
        
        
  task remotelyawesome: :environment do
            # remotelyawesome tweet
      array_remotelyawesome =  Remotelyawesome.all
      
       max = [5, Remotelyawesome.count - 1].min
      
      random_number_remotelyawesome = rand(0..(max))
      select_tweet_remotelyawesome = "#{array_remotelyawesome[random_number_remotelyawesome].job_title}:  #{array_remotelyawesome[random_number_remotelyawesome].job_description}"
      truncated_tweet_remotelyawesome = select_tweet_remotelyawesome.truncate(110)
       
        # pp"#{select_tweet_remotelyawesome}"
        pp"#{truncated_tweet_remotelyawesome}"
        pp "remotelyawesome"
        client.update("#{truncated_tweet_remotelyawesome} https://goo.gl/2fE7xE")
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
