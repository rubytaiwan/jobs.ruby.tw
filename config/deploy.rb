# -*- encoding : utf-8 -*-
set :application, 'lrs'
set :repo_url, 'git@github.com:rubytaiwan/jobs.ruby.tw.git'
#set :branch, 'master'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
#require 'yaml'
#settings = YAML.load(File.read(File.expand_path('../config.yml', __FILE__)))['development']
#
#set :flowdock_api_token, settings['flowdock']['api_token']
#set :flowdock_project_name, settings['flowdock']['project_name']
#set :flowdock_deploy_tags, settings['flowdock']['deploy_tags']

set :deploy_to, '/home/deploy/jobs.ruby.tw'
set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

set :linked_files, %w{config/database.yml config/email.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :keep_releases, 3

after :'deploy:publishing', :'deploy:restart'
namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
  after :finishing, 'deploy:cleanup'
end


#
#raw_config = File.read("config/config.yml")
#APP_CONFIG = YAML.load(raw_config)
#
#require "./config/boot"
#require "bundler/capistrano"
#require "rvm/capistrano"
#require "whenever/capistrano"
##require 'hipchat/capistrano'
#require 'cape'
#
#
#default_environment["PATH"] = "/usr/local/ruby21/bin:/opt/ruby/bin:/usr/local/bin:/usr/bin:/bin"
#
#set :application, "lrs-recruiting"
#set :repository,  "git@gitlab-fsc.tomlan.tw:5xruby/lrs.git"
#set :deploy_to, "/home/deploy/#{application}"
#
#set :branch, "master"
#set :scm, :git
#
#set :user, "apps"
#set :group, "apps"
#
#set :runner, "apps"
#set :deploy_via, :remote_cache
#set :git_shallow_clone, 1
#set :use_sudo, false
##set :rvm_ruby_string, '2.0.0'
#
#set :whenever_command, "bundle exec whenever"
##set :hipchat_token, APP_CONFIG["production"]["hipchat_token"]
##set :hipchat_room_name, APP_CONFIG["production"]["hipchat_room_name"]
##set :hipchat_announce, false # notify users?
#
#set :deploy_env, "production"
#set :rails_env, "production"
#set :scm_verbose, true
#set :use_sudo, false
#
## require "delayed/recipes"
##
## after "deploy:stop", "delayed_job:stop"
## after "deploy:start", "delayed_job:start"
## after "deploy:restart", "delayed_job:restart"
##
#
#Cape do
#  mirror_rake_tasks :dev do |env|
#    env['RAILS_ENV'] = rails_env
#  end
#
#  mirror_rake_tasks :taiwan_city_dists_helper do |env|
#    env['RAILS_ENV'] = rails_env
#  end
#
#end
#
#
#namespace :deploy do
#
#  desc "Restart passenger process"
#  task :restart, :roles => [:web], :except => { :no_release => true } do
#    run "touch #{current_path}/tmp/restart.txt"
#  end
#end
#
#
#namespace :my_tasks do
#  task :symlink, :roles => [:web] do
#    run "mkdir -p #{deploy_to}/shared/log"
#    run "mkdir -p #{deploy_to}/shared/pids"
#
#    symlink_hash = {
#      "#{shared_path}/config/database.yml.production"   => "#{release_path}/config/database.yml",
#      # "#{shared_path}/config/s3.yml"   => "#{release_path}/config/s3.yml",
#      # "#{shared_path}/uploads"              => "#{release_path}/public/uploads",
#    }
#
#    symlink_hash.each do |source, target|
#      run "ln -sf #{source} #{target}"
#    end
#  end
#
#end
#
#
#
#namespace :remote_rake do
#  desc "Run a task on remote servers, ex: cap staging rake:invoke task=cache:clear"
#  task :invoke do
#    run "cd #{deploy_to}/current; RAILS_ENV=#{rails_env} bundle exec rake #{ENV['task']}"
#  end
#end
#
#after "deploy:finalize_update", "my_tasks:symlink"
#
#
#require './config/boot'
#require 'airbrake/capistrano'

# -*- encoding : utf-8 -*-
#require 'bundler/capistrano'
#
#set :application, 'jobs.ruby.tw'
#set :repo_url,  'git://github.com/rubytaiwan/jobs.ruby.tw.git'
#
#set :scm, :git
#set :deploy_via, :remote_cache
#set :scm_verbose, true
#set :use_sudo, false
#
#set :user, 'deploy'
#set :port, '22'
#set :branch, 'master'
#
#server 'rubytw.cloudapp.net', :web, :app, :db, primary: true
#set :deploy_to, "/home/#{user}/#{application}"
#
## if you want to clean up old releases on each deploy uncomment this:
#after 'deploy:restart', 'deploy:cleanup'
#
## If you are using Passenger mod_rails uncomment this:
#namespace :deploy do
#  task :start do; end
#  task :stop do; end
#  task :restart, roles: :app, except: { no_release: true } do
#    run "#{try_sudo} touch #{File.join(current_path, 'tmp', 'restart.txt')}"
#  end
#
#  task :custom_setup, roles: [:app] do
#    run "cp #{shared_path}/config/*.yml #{release_path}/config/"
#  end
#
#end
#
#after 'deploy:finalize_update', 'deploy:custom_setup'
