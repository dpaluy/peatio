# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, "mikado"
set :repo_url, "git@github.com:dpaluy/peatio.git"
set :branch, 'mkd'

set :deploy_to, '/var/www/mikado'

set :linked_files, fetch(:linked_files, []).push(
  'config/application.yml', 'config/puma.rb', 'config/deposit_channels.yml',
  'config/markets.yml', 'config/withdraw_channels.yml'
)

set :format, :pretty
set :log_level, :debug
set :pty, true

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 3

# Puma:
set :puma_conf, "#{shared_path}/config/puma.rb"

namespace :deploy do
  before 'check:linked_files', 'puma:config'
  before 'check:linked_files', 'puma:nginx_config'
  after 'puma:smart_restart', 'nginx:restart'
end
