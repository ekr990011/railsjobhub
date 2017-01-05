namespace :freelance do
  desc "TODO"
  task freelancer: :environment do
    require 'mechanize'
    
    @a = Mechanize.new
    @a.user_agent_alias = 'Mac Safari 4'
    @page = @a.get('https://www.freelancer.com/jobs/Ruby_on_Rails/1/?cl=l-en')
    @exclude_list = ["\n                                I forgot my password\n                            ", 
    "\n                ×\n            ", "\n    \n\n", "\n    \n  \n\n\n", "\n                                   I forgot my password\n                                ", 
    "\n        \n    \n    \n\n\n        US (International) / English\n", "\n                            Code of Conduct\n                    ", 
    "\n                            Copyright Infringement Policy\n                    ", "\n                            Copyright Infringement Policy\n                    ", 
    "\n                            Terms and Conditions\n                    ", "\n                            Privacy Policy\n                    ", 
    "\n                            Contact Us\n                    ", "\n                            Merchandise\n                    ", 
    "\n                            Affiliate Program\n                    ", "\n                            Community\n                    ", 
    "\n                            Careers\n                    ", "\n                            Advertise with Us\n                    ", 
    "\n                            Get Support\n                    ", "\n                            Timeline\n                    ", 
    "\n                            Testimonials\n                    ", "\n                            Awards\n                    ", 
    "\n                            Press Releases\n                    ", "\n                            In the News\n                    ", 
    "\n                            Quotes\n                    ", "\n                            Investor\n                    ", 
    "\n                            Fees & Charges\n                    ", "\n                            Report Bug\n                    ", 
    "\n                            Security\n                    ", "\n                            Mobile App\n                    ", 
    "\n                            Team\n                    ", "\n                            How it Works\n                    ", 
    "\n                            About us\n                    ", "\n                            Freemarket\n                    ", 
    "\n                            Warrior Forum\n                    ", "\n                            Escrow\n                    ", 
    "\n                            Services\n                    ", "\n                            Freelancer Local\n                    ", 
    "\n                            User Directory\n                    ", "\n                            Projects Directory\n                    ", 
    "\n                            Sitemap\n                    ", "\n                            Contests\n                    ", 
    "\n                            Projects\n                    ", "\n                            Desktop App\n                    ", 
    "\n                        \n                ", "http://enable-javascript.com", "Freelancer Logo\n", "\n                            Hire Freelancers\n                        ", 
    "\n                                                Post a Project\n                                            ", "\n                                                Post a Contest\n                                            ", 
    "\n                                                Post a Local Job\n                                            ", "\n                                                Showcase\n                                            ", 
    "\n                                                Browse Directory\n                                            ", "\n                                                Community\n                                            ", 
    "\n                            Work\n                        ", "\n                                                Browse Projects\n                                            ", 
    "\n                                                Browse Contests\n                                            ", 
    "\n                                                Browse Categories\n                                            ", "\n                            How It Works\n                        ", 
    "\n                            Post a Project\n                        ", "\n                        Freelancer\n                    ", 
    "\n                            Jobs\n                        ", "\n                            Ruby on Rails\n                        ", 
    "Ruby Forum", "Hire Ruby on Rails Developers on Freelancer", "\n            \n                \n            \n            \n                \n    \n\n\n                Signup to start earning\n                \n                    \n                        Are you a Ruby on Rails Developer? You could be earning money\n                        working on these jobs!\n                    \n                \n                \n                \n                    \n                \n            \n        ", 
    "1", "2", "3", "4", "5", "»", "›"]
    
    
    #Block below is to get titles on the page & the job skills
    # @page.links.each do |x|
    #   if @exclude_list.exclude?(x.text) 
    #     if x.uri.to_s.include?("/projects/")
    #       pp x.text
    #     elsif x.uri.to_s.include?("/jobs/")
    #       pp x.text
    #     end
    #   end
    # end
    
    pp @page.search('//*[@id="project_table_static"]/tbody/tr[1]/td[2]')
   
  end
end
