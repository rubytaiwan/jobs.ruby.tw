# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
role = Role.find_by(name: "admin") || Role.create!(name: "admin")
user = User.create!(email: 'admin@ruby.tw', password: 'rubytw1234', password_confirmation: 'rubytw1234', role_id: role.id)
user.confirmed_at = Time.now
user.save

job = Job.create!(title: 'Rails developer', url: 'http://ruby.tw',
                  company_name: 'Ruby Taiwan', job_type: 'Full-time', occupation: 'Web back-end',
                  location: 'Taipei', user_id: 1,
                  description: 'This is awesome Ruby job!<br>The salary is also great!', apply_information: 'Please email to me')
