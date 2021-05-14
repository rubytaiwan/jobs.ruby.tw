# Rails 4 needs bundler 1.X
# gem install bundler:1.17.3
# bundle _1.17.3_ install
source "https://rubygems.org"

gem "rails", "4.2.11.3"

# Need setup manifest.js for sprockets v4
gem 'sprockets', '~> 3.7.2'

gem 'bigdecimal', '1.3.5'

gem "pg", "0.21.0" # Rails 4

gem "sassc-rails"
gem "coffee-rails"
gem "jquery-rails"
gem "bootstrap-sass"

gem "uglifier"

gem "devise", ">= 4.7.1"
gem "babosa"
gem "rails_autolink"
gem "settingslogic"
gem "seo_helper"
gem "open_graph_helper"
gem "google_plus_helper"
gem "exception_notification"
gem "utf8-cleaner"
gem "rails_utils"

group :development do
  gem "quiet_assets"
  gem "capistrano"
  gem "capistrano-rails"
  gem "annotate"
  gem "letter_opener"
  gem "spring"
  gem "spring-commands-rspec"
  gem "pry-rails"
end

group :test do
  gem "shoulda-matchers", require: false
end

group :test, :development do
  gem "rspec-rails"
  gem "simplecov"
  gem "capybara"
  gem "factory_girl_rails"
end
