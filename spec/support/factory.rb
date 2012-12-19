# -*- encoding : utf-8 -*-
def build_user(attributes={})
  user = User.new( { email: "admin@ruby.tw", password: "rubytw", password_confirmation: "rubytw" }.merge(attributes) )
  user.skip_confirmation!
  user.save!
  user
end

def build_job(attributes={})
  attributes[:owner] ||= build_user
  Job.create!( { title: "Rails developer", url: "http://ruby.tw",
                 company_name: "Ruby Taiwan", job_type: "Full-time", occupation: "Web back-end",
                 location: "Taipei", user_id: 1, deadline: Date.parse("2099-06-28"),
                 description: "This is awesome Ruby job!<br>The salary is also great!", apply_information: "Please email to me" }.merge(attributes) )
end
