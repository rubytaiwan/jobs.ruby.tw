# -*- encoding : utf-8 -*-
require 'bundler/capistrano'

set :application, "jobs.ruby.tw"
set :repository,  "git://github.com/rubytaiwan/jobs.ruby.tw.git"

set :scm, :git
set :deploy_via, :remote_cache
set :scm_verbose, true
set :use_sudo, false

set :user, "deploy"
set :port, "21222"
set :branch, "master"

server "140.109.17.62", :web, :app, :db, :primary => true
set :deploy_to, "/home/#{user}/#{application}"

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :custom_setup, :roles => [:app] do
    run "cp #{shared_path}/config/*.yml #{release_path}/config/"
  end

end

after "deploy:finalize_update", "deploy:custom_setup"
