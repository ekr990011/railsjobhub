# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

# Load the SCM plugin appropriate to your project:
#
# require "capistrano/scm/hg"
# install_plugin Capistrano::SCM::Hg
# or
# require "capistrano/scm/svn"
# install_plugin Capistrano::SCM::Svn
# or
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# Include tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#   https://github.com/capistrano/passenger
#
# require "capistrano/rails"
require 'capistrano/linked_files'
require 'rvm1/capistrano3'
require 'capistrano/bundler'
# require "capistrano/rbenv"
# require "capistrano/chruby"
require "capistrano/rails/assets"
require "capistrano/rails/migrations"
# require "capistrano/passenger"


# Cap Puma Config
#
# To list available tasks use cap -T
#
# To upload puma config use:
#
# cap production puma:config
#
# By default the file located in shared/puma.rb
#
# Ensure that tmp/pids and tmp/sockets log are shared (via linked_dirs):
#
# This step is mandatory before deploying, otherwise puma server won't start
# Nginx
#
# To upload a nginx site config (eg. /etc/nginx/sites-enabled/) use:
#
# cap production puma:nginx_config
#
# To customize these two templates locally before uploading use:
#
# rails g capistrano:nginx_puma:config
require 'capistrano/puma'
install_plugin Capistrano::Puma
# if you want to upload a nginx site template
install_plugin Capistrano::Puma::Nginx




# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
