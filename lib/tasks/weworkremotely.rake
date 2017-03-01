namespace :wework do
  desc "TODO"
  task rails: :environment do
    require 'mechanize'
    #.gsub(/\n\s/, "")
    
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    @page = @a.get('https://weworkremotely.com/jobs/search?term=Ruby+on+Rails')
    @rows = @page.search('#category-2 > article > ul > li')
    @row = 1
    while @row < (@rows.count - 1 ) 
      @link = @rows[@row].at('a').values.first #link rel href
      @row_element_count = @rows[@row].search('span').children.count
      @text_count = 0 #counter for row text extraction
      while @text_count < @row_element_count #loop through row elements
        if @row_element_count == 4 #if "new" tag is leading row
          case @text_count
            when 1
              @company = @rows[@row].search('span').children[@text_count].text
            when 2 
              @description = @rows[@row].search('span').children[@text_count].text
            when 3
              @date = @rows[@row].search('span').children[@text_count].text
          end #end case
          @text_count += 1
        else #if tag "new" is not leading row
          case @text_count
            when 0
              @company = @rows[@row].search('span').children[@text_count].text
            when 1
              @description = @rows[@row].search('span').children[@text_count].text
            when 2
              @date = @rows[@row].search('span').children[@text_count].text
           end #end case
        @text_count += 1
        end #end if
      end #end while inner
      WeworkRail.create do |x|
       x.company = @company
       x.description = @description
       x.date = @date  
       x.link = ("https://weworkremotely.com" + @link)
      end #end database creation
    @row += 1
    end #end while outer
  end #end task
end #end namespace