require "rails_helper"

RSpec.feature "Authentications" do
  scenario "Sign up" do
    visit new_user_registration_path

    fill_in "Email", with: "dhh@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Sign up"

    expect(page).to have_content "A message with a confirmation link"
  end

  scenario "Sign in" do
    create(:user, email: "dhh@example.com")

    visit root_path

    click_on "Login"

    fill_in "Email", with: "dhh@example.com"
    fill_in "Password", with: "password"

    click_button "Sign in"

    expect(page).to have_content "Signed in successfully."
  end

  scenario "Sign out" do
    user = create(:user, email: "dhh@example.com")
    fast_sign_in_as(user)

    visit root_path

    expect(page).to have_content "Hi, dhh@example.com"

    click_on "Logout"

    expect(page).to have_content "Signed out successfully"
  end
end
