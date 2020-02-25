set :application, 'jobs.ruby.tw'
set :repo_url, 'git@github.com:rubytaiwan/jobs.ruby.tw.git'
#set :branch, 'master'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
#require 'yaml'
#settings = YAML.load(File.read(File.expand_path('../config.yml', __FILE__)))['development']
#
#set :flowdock_api_token, settings['flowdock']['api_token']
#set :flowdock_project_name, settings['flowdock']['project_name']
#set :flowdock_deploy_tags, settings['flowdock']['deploy_tags']

set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

set :linked_files, %w{config/database.yml config/email.yml config/config.yml config/secrets.yml}
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
