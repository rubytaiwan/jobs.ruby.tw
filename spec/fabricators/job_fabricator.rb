Fabricator(:job) do
  title 'Rubyist'
  job_type Job::JOB_TYPE.sample
  company_name '37 Signals'
  occupation Job::OCCUPATION.sample
  location 'Taipei'
  description 'Ruby on Rails -- ' + Faker::Lorem.paragraph
  apply_information Faker::Lorem.paragraph
  owner { Fabricate(:user) }
end
