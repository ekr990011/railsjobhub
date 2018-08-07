namespace :careerbuilder do
  desc "TODO"
  task rails: :environment do
    require 'mechanize'
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    @page = @a.get('http://www.careerbuilder.com/jobs-ruby-rails?sort=date_desc')
    
    @job_count = 0
#    @job_total = @page.search('#main-content > div:nth-child(6) > div.small-12.large-10.columns > div.results-area > div.job-list.card > div.jobs > .job-row').count
    @job_total = @page.search('.jobs > div.job-row').count
    puts "job total #{@job_total}"
    while @job_count < @job_total
      begin
        @job_title = @page.search('div.jobs > div.job-row > div.row > div.column > h2 > a')[@job_count].text
        @job_description = @page.search('div.jobs > div.job-row > div.row.job-information > div.medium-6 > div.job-description')[@job_count].text.strip
        @job_link = 'http://www.careerbuilder.com' + @page.search('div.jobs > div.job-row > div.row > div.column > h2 > a')[@job_count].attribute("href").value
        @job_date = @page.search('div.jobs > div.job-row > div.row > div.time-posted > div.hide-for-medium-up')[@job_count].text.strip
        @job_company = @page.search('div.jobs > div.job-row > div.row.job-information > div.medium-3 > h4 > a')[@job_count].text
        puts @job_title
        
        Careerbuilder.create do |x|
          x.job_title = @job_title
          x.job_description = @job_description
          x.job_link = @job_link
          x.job_date = @job_date
          x.job_company = @job_company
        end
        pp @job_count
        @job_count += 1
      rescue
        pp "needed rescue"
        pp @job_count
        @job_count += 1
      end
    end
    Careerbuilder.where("created_at < ?", (Time.now - 10.minutes)).destroy_all
  end
end