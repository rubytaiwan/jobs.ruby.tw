set :deploy_to, '/home/deploy/jobs.ruby.tw'
set :branch, ENV["REVISION"] || ENV["BRANCH_NAME"] || "master"
set :stage, :production
role :web, "deploy@rubytw.cloudapp.net"
role :app, "deploy@rubytw.cloudapp.net"
role :db,  "deploy@rubytw.cloudapp.net", :primary => true
