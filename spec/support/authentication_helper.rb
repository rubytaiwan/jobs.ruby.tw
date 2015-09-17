include Warden::Test::Helpers
Warden.test_mode!

module AuthenticationHelper
  def sign_in_as(user)
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"

    click_button "Sign in"
  end

  def fast_sign_in_as(user)
    login_as(user, scope: :user)
  end
end
