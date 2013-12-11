namespace :dev do

  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", "db:seed"]

  desc "Fake Data"
  task fake: :environment do
    # create fake data here
  end
end
