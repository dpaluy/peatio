namespace :redis do
  desc 'start redis'
  task :start do
    on primary :web do
      run 'redis-server --daemonize yes'
    end
  end
end
