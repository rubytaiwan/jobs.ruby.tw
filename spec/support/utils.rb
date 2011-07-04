def login!
  visit "/users/sign_in"
  within("#user_new") do
    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => 'rubytw'
  end
  click_button 'Sign in'
end