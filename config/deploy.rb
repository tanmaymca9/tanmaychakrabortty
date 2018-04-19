# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"
set :application, "EduOracle"
set :repo_url, "git@github.com:tabashi001/Oracle.git"
set :branch, 'master'
set :user, 'ubuntu'


set :deploy_to, "/home/ubuntu/www/project"

set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord
# set :linked_files, %w(config/application.yml)
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp', 'public/system', "public/downloads", "public/assets")
#sidekiq
# set :sidekiq_role, [:app]
# set :sidekiq_pid => File.join(current_path, 'tmp', 'pids', 'sidekiq.pid')
# set :sidekiq_log => File.join(shared_path, 'log', 'sidekiq.log')
# set :sidekiq_options, "-q default -q mailers,7 -q critical,5"
# set :sidekiq_env =>  'production'
namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end
  before :start, :make_dirs
end

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  #after  :finishing,    :restart
end