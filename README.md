# jobs.ruby.tw

Job board for Ruby and Rails developers in Taiwan

A free service by Ruby Taiwan http://ruby.tw

[![Build Status](https://travis-ci.org/rubytaiwan/jobs.ruby.tw.svg?branch=master)](https://travis-ci.org/rubytaiwan/jobs.ruby.tw) [![Code Climate](https://codeclimate.com/github/rubytaiwan/jobs.ruby.tw.svg)](https://codeclimate.com/github/rubytaiwan/jobs.ruby.tw)

## Requirements

* Ruby >= 1.9.3
* Bundler

## How to get started?

```
bin/setup
```

## How to run spec?

```bash
bin/rspec
```

## User Stories

- [v] Signup as an employer
- [v] Post a job
- [v] List my jobs
- [v] Edit my job
- [v] Search jobs
- [v] Employer can close job
- [v] Not display jobs which is closed or overdue
- [v] Employer can select deadline date or click forever checkbox
- [v] Social link: Tweet this job, Facebook it, Plurk it.
- [v] RSS feed
- [v] Employer can preview job posting
- [v] Mobile interface
- [v] Auto-deployment
- [ ] Model JobType and Occupation
- [ ] Caching for jobs/index and jobs/show actions
- [ ] Highlight the job if employer sponsors via paypal

## Employer profile

* Login name
* Password
* Email

## Job profile

* Job title
* Job type: Full-time, Part-time, Contract, Internship, Other
* Job occupation: Web back-end, Web front-end, Web-design, QA/Testing, Other
* Company name
* Location
* URL
* Description
* How to Apply for this position
* Deadline

## Web Design

* Job index page
* Job show page
* New/Editing job page
* Sign-up, Sign-in, Forget password, Resend confirmation pages
* About page

## Reference sites

* http://ruby.jobamatic.com/a/jbb/find-jobs
* http://www.railsjob.com/
* http://www.workingwithrails.com/browse/jobs/recent
* http://jobs.37signals.com/
* http://jobs.rubynow.com/

## Contributors

See [full list of contributors](https://github.com/rubytaiwan/jobs.ruby.tw/graphs/contributors)

## License

* The code is licensed under the [MIT License](/LICENSE)
* The images (any files inside `/app/assets/images`) are copyright.
