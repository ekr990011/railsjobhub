namespace :work do
  desc "TODO"
  task onit: :environment do
    require 'mechanize'
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    
     @page = @a.get("http://stackoverflow.com/jobs/developer-jobs-using-ruby-on-rails?pg=1")
     
    @link = "http://stackoverflow.com" + @page.search('div.-job-summary > div.-title > h2 > a')[0].attr('href')
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
    pp @description.truncate(500)
    
  end
end