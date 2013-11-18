# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

user = User.create!(:email => "admin@ruby.tw", :password => "rubytw", :password_confirmation => "rubytw")
user.confirmed_at = Time.now
user.save

job = Job.create!( :title => "Rails developer", :url => "http://ruby.tw",
                   :company_name => "Ruby Taiwan", :job_type => "Full-time", :occupation => "Web back-end",
                   :location => "Taipei", :user_id => 1,
                   :description => "This is awesome Ruby job!<br>The salary is also great!", :apply_information => "Please email to me" )
