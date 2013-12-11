source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 2.3.2'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'puma', '~> 2.7.1'

gem 'capistrano-puma'

gem 'jbuilder'

gem 'devise', '~> 3.2.2'

gem 'http_accept_language', '~> 2.0.0'

gem 'ransack', github: 'activerecord-hackery/ransack', branch: 'rails-4'

gem 'mysql2'

gem 'babosa'

gem 'rails_autolink'

gem 'settingslogic'

# Search Engine Optimization (SEO) plugin for Ruby on Rails applications.
gem 'meta-tags', :require => 'meta_tags'

gem 'seo_helper'

gem 'open_graph_helper'

gem 'google_plus_helper'

gem 'exception_notification'

gem 'mobile-fu'

group :development do
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
  gem 'capistrano-rails'
  gem 'annotate'
  gem "migration_comments"
  gem 'sqlite3'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'fabrication', '~> 2.9.3'
  gem 'ffaker'
  gem 'simplecov'
  gem 'timecop'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'awesome_print'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-stack_explorer'

  if RUBY_VERSION >= '2.0.0'
    gem 'pry-byebug'
  else
    gem 'pry-debugger'
    gem 'pry-remote'
  end

  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'database_rewinder'
end

