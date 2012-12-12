#!/bin/sh -x

gem install bundler --version '>= 1.2.0'

cp -R .travis/config/* config/

mysql -e 'create database jobs_test;'

bundle exec rake db:schema:load
