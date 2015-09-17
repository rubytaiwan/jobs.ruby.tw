set :default_env, { path: "/usr/local/ruby22/bin:$PATH" }
set :deploy_to, '/home/rubytw/jobs.ruby.tw'
set :branch, ENV["REVISION"] || ENV["BRANCH_NAME"] || "master"
set :stage, :production
role :web, "rubytw@60.250.121.194"
role :app, "rubytw@60.250.121.194"
role :db,  "rubytw@60.250.121.194", :primary => true
