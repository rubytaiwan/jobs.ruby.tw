Fabricator(:user) do
  email Faker::Internet.email
  password ["8NyuQFIs", "XxOv7qLy", "1mGj1APe", "b05I5WJk"].sample
end
