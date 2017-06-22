namespace :stack do
  desc "TODO"
  task rails: :environment do
    require 'mechanize'
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    
    @pg = 1
    
    while @pg < 3
      @page = @a.get("http://stackoverflow.com/jobs/developer-jobs-using-ruby-on-rails?pg=#{@pg}")
      pp @page
      @page_job_count = @page.search('div.-job-info').count
      @job_count = 0
      while @job_count < @page_job_count
        @title = @page.search('div.-job-info > div.-title > h2 > a')[@job_count].text
        @link = "http://stackoverflow.com" + @page.search('div.-job-info > div.-title > h2 > a')[@job_count].attr('href')
        @company = @page.search('div.-job-info > div.-meta-wrapper > ul > li')[@job_count].text.strip
        @skills = @page.search('div.-job-info > div.tags > p')[@job_count].text
        @date_posted = @page.search('div.-job-info > p')[@job_count].text.strip
          StackJob.create do |x|
            x.title = @title
            x.link = @link
            x.company = @company
            x.skills = @skills
            x.date_posted = @date_posted
          end
        @job_count += 1
      end  #end while inner
      @pg += 1
    end  #end while outer
    
    StackJob.where(created_at: (10.minutes.ago..Time.now)).destroy_all
  end  #end task
end  #end namespace