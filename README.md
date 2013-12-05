Job board for Ruby and Rails developers in Taiwan
A free service by Ruby Taiwan http://ruby.tw

== Requirements

* Ruby 1.9.3
* Bundler

== How to get started?

* cp config/database.yml.example config/database.yml
* bundle
* rake db:create:all
* rake db:migrate
* rake db:seed
* rails server

== How to run spec?

* rake spec

== User Stories

[v] Signup as an employer
[v] Post a job
[v] List my jobs
[v] Edit my job
[v] Search jobs
[v] Employer can close job
[v] Not display jobs which is closed or overdue
[v] Employer can select deadline date or click forever checkbox
[v] Social link: Tweet this job, Facebook it, Plurk it.
[v] RSS feed
[v] Employer can preview job posting
[v] Mobile interface
[v] Auto-deployment
[ ] Model JobType and Occupation
[ ] Caching for jobs/index and jobs/show actions
[ ] Highlight the job if employer sponsors via paypal

== Employer profile

* Login name
* Password
* Email

== Job profile

* Job title
* Job type: Full-time, Part-time, Contract, Internship, Other
* Job occupation: Web back-end, Web front-end, Web-design, QA/Testing, Other
* Company name
* Location
* URL
* Description
* How to Apply for this position
* Deadline

== Web Design

* Job index page
* Job show page
* New/Editing job page
* Sign-up, Sign-in, Forget password, Resend confirmation pages
* About page

== Reference sites

* http://ruby.jobamatic.com/a/jbb/find-jobs
* http://www.railsjob.com/
* http://www.workingwithrails.com/browse/jobs/recent
* http://jobs.37signals.com/
* http://jobs.rubynow.com/

== Contributors

* ihower <ihower@gmail.com>
* xdite <xuite.joke@gmail.com>
* Lawrence Lin <deduce@gmail.com>
* TaopaiC <pctao.git@pctao.org>

== License

* The code is licensed under the MIT: http://www.opensource.org/licenses/mit-license.php
* The images (any files inside /app/assets/images) are copyright.
