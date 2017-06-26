namespace :stack do
  desc "TODO"
  task rails: :environment do
    require 'mechanize'
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    
    @pg = 1
    
    while @pg < 3
      @page = @a.get("http://stackoverflow.com/jobs/developer-jobs-using-ruby-on-rails?pg=#{@pg}")
      pp "Made it to page #{@pg}"
      @page_job_count = @page.search('div.-job-summary').count
      @job_count = 0
      while @job_count < @page_job_count
        pp "Made it to job #{@job_count}"
        @title = @page.search('div.-title > h2 > a')[@job_count].text
        @link = "http://stackoverflow.com" + @page.search('div.-job-summary > div.-title > h2 > a')[@job_count].attr('href')
        @company_name = @page.search('div.-company')[0].elements[0].text.strip
        @company_location = @page.search('div.-company')[0].elements[1].text.strip.gsub(/\W/, '')
        @company = @company_name + "- " + @company_location
        @skills = @page.search('div.-job-summary > div.-tags > p')[@job_count].text
        @date_posted = @page.search('div.-job-summary > .-title > .-posted-date')[@job_count].text.strip
        
        @description = nil
        @description_array = []
        @page2 = @a.get(@link)
        @page2.search("#overview-items > .-job-description > .description").children.each do |n|
          @nplus = n.text.strip
          @description_array << @nplus unless @nplus == ""
        end
        @description_array.each do |x|
          if @description.nil?
            @description = x
          else
            @description = @description + x
          end
        end
        
        StackJob.create do |x|
          x.title = @title
          x.link = @link
          x.company = @company
          x.skills = @skills
          x.date_posted = @date_posted
          x.description = @description.truncate(500)
        end
        pp "Saved #{@job_count}"
        @job_count += 1
      end  #end while inner
      @pg += 1
    end  #end while outer
    
    StackJob.where("created_at < ?", (Time.now - 10.minutes)).destroy_all
  end  #end task
end  #end namespace