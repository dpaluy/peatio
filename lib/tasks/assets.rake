# frozen_string_literal: true

# lib/tasks/assets.rake
Rake::Task['assets:precompile']
    .clear_prerequisites
    .enhance(['assets:compile_environment'])

namespace :assets do
  # In this task, set prerequisites for the assets:precompile task
  task compile_environment: :yarn do
    Rake::Task['assets:environment'].invoke
  end
  
  desc 'Yarn install'
  task :yarn do
    Rake::Task['yarn:install'].invoke
  end
end
