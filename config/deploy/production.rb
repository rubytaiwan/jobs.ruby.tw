set :default_env, { path: "/usr/local/ruby22/bin:$PATH" }
set :deploy_to, '/home/rubytw/jobs.ruby.tw'
set :branch, ENV["REVISION"] || ENV["BRANCH_NAME"] || "master"
set :stage, :production
role :web, "deploy@5xruby.tw"
role :app, "deploy@5xruby.tw"
role :db,  "deploy@5xruby.tw", :primary => true
