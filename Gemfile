source 'https://rubygems.org'
# source 'http://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'

gem "feedjira"
# gem 'stripe'
# gem 'bootstrap-wysihtml5-rails'

gem 'webpacker', '~> 4.0', '>= 4.0.2'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
# gem 'sass-rails', '~> 5.0'
gem 'sucker_punch'
# Use Uglifier as compressor for JavaScript assets
# gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.2'
gem 'will_paginate', '~> 3.1.0'
# gem 'carrierwave', '~> 1.0'

gem "nokogiri"
gem 'mechanize'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# gem 'phantomjs', '~> 2.1', '>= 2.1.1.0'

# Use jquery as the JavaScript library
# gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# gem "bootstrap-sass", ">= 3.4.1"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'rails_12factor'

gem 'twitter', '~> 6.2'
gem 'omniauth', '~> 1.9'
gem 'omniauth-twitter', '~> 1.4'

gem 'whenever', require: false

group :test do
  gem 'database_cleaner', '~> 1.6', '>= 1.6.2'
  gem 'capybara', '~> 2.17'
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pg'
  gem 'pg_search', '~> 1.0', '>= 1.0.5'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'capistrano',         require: false
  gem 'capistrano-linked-files', require: false
  gem 'rvm1-capistrano3', require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', '~> 1.6', require: false
  gem 'capistrano3-puma',   require: false
end

group :production do
  gem 'pg'
  gem 'pg_search', '~> 1.0', '>= 1.0.5'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
