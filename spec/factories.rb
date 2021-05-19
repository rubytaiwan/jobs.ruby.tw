FactoryBot.define do
  factory :user, aliases: [:owner]  do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
    password_confirmation "password"

    after :create, &:confirm
  end

  factory :job do
    title "Ruby Developer"
    job_type "Full-time"
    company_name "Ruby Taiwan"
    occupation "Web back-end"
    location "Taipei, Taiwan"
    description "Awesome Rails Job"
    apply_information "Mail to here"

    owner
  end

  factory :role do
  end
end
