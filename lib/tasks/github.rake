namespace :github do
  desc "TODO"
  task rails: :environment do
    require 'mechanize'
    require 'json'
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    @page = @a.get('https://jobs.github.com/positions.json?description=Rails')
    
    @job_count = @parsed_job = JSON.parse(@page.body).count
    @job_counter = 0
    while @job_counter < (@job_count) do
      @job_title = @parsed_job = JSON.parse(@page.body)[@job_counter]["title"]
      @job_link = @parsed_job = JSON.parse(@page.body)[@job_counter]["url"]
      @job_description = @parsed_job = JSON.parse(@page.body)[@job_counter]["description"]
      @job_apply = @parsed_job = JSON.parse(@page.body)[@job_counter]["how_to_apply"]
      @job_company = @parsed_job = JSON.parse(@page.body)[@job_counter]["company"]
      @job_location = @parsed_job = JSON.parse(@page.body)[@job_counter]["location"]
      @job_date = @parsed_job = JSON.parse(@page.body)[@job_counter]["created_at"]
    
      Github.create do |x|
        x.job_title = @job_title
        x.job_link = @job_link
        x.job_description = @job_description
        x.job_company = @job_company
        x.job_location = @job_location
        x.job_date = @job_date
        x.job_apply = @job_apply
      end
      @job_counter += 1
    end
    Github.where("created_at < ?", (Time.now - 10.minutes)).destroy_all
  end
end
