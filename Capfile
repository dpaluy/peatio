# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

# Include capistrano-rails
require 'capistrano/rails'
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'
require 'capistrano/rails/assets'
require 'capistrano/nginx'
require 'capistrano/puma'
require 'capistrano/puma/nginx'
require 'capistrano/upload-config'
require 'capistrano/figaro_yml'

install_plugin Capistrano::Puma # Default puma tasks
install_plugin Capistrano::Puma::Jungle # if you need the jungle tasks
install_plugin Capistrano::Puma::Nginx # if you want to upload a nginx site template


require "capistrano/deploy"
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
