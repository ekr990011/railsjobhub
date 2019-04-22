namespace :scrape do
  task rails: :environment do

    GithubJob.new.perform
    WeworkremotelyJob.new.perform
    IndeedJob.new.perform
    StackoverflowJob.new.perform
    RemoteokJob.new.perform
    RorjobsJob.new.perform

  end

  task clean: :environment do

    ScrapeCleanJob.new.perform

  end
  
end
