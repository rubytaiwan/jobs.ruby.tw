# -*- encoding : utf-8 -*-
def login!
  visit "/users/sign_in"
  within("#new_user") do
    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => 'rubytw'
  end
  click_button 'Sign in'
end
