namespace :freelance do
  desc "TODO"
  task freelancer: :environment do
    require 'mechanize'
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    @page = @a.get('https://www.freelancer.com/jobs/Ruby_on_Rails/1/?cl=l-en')
      @rows = @page.search('#project_table_static > tbody > tr')
      @count = 0
      pp# @rows[1].children[13].text.strip.sub(/\W*/, "")
      # 1,3,5,7,9,11,13
      while @count < 20 do
       @href = @rows[@count].children[1].at('a').first[1]  # href for job
       @title =  @rows[@count].children[1].text.strip
       @description = @rows[@count].children[3].text.strip
       @bids = @rows[@count].children[5].text.strip
       @skills = @rows[@count].children[7].text.strip
       @date_start = @rows[@count].children[9].text.strip
       @date_finish =  @rows[@count].children[11].text.strip.sub("Today", "")
       @budget = @rows[@count].children[13].text.strip
       @count += 1
       pp @title
       pp @count
      end

  end
end
