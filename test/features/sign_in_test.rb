require "test_helper"

feature "A user must be able to sign in in a variety of ways" do

  before do
    visit root_path
    seed_db
  end

  scenario "As a user I want to create a new mentor account " do
    page.must_have_content"Dexter"
    first(:link, "Become a Mentor").click
    fill_in "Email", with: users(:mentor_user).email
    fill_in "Password", with: 12345678
    fill_in "user_password_confirmation", with: 12345678
    click_on "Submit"
    page.must_have_content "Create Account"
  end

  scenario "As a user I want to create a new mentee account " do
    page.must_have_content"Dexter"
    first(:link, "Find a Mentor").click
    fill_in "Email", with: users(:mentee_user).email
    fill_in "Password", with: 12345678
    fill_in "user_password_confirmation", with: 12345678
    click_on "Submit"
    page.must_have_content "Create Account"
  end


  scenario "signed in users are taken to their dashboard" do
    sign_in_mentee
    visit root_path
    page.current_path.must_equal dashboard_path users(:mentee_user)
  end

  # scenario "sign in with github works" do
  #   visit splash_path
  #   click_link "Find a Mentor"
  #   OmniAuth.config.test_mode = true
  #   Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
  #   Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
  #   OmniAuth.config.add_mock(:github,
  #                           {
  #                           uid: '12345',
  #                           info: { nickname: 'test_github_user', email: 'test_github_user@example.com'},
  #                           })
  #   find("a[class='github']").click
  #   page.must_have_content "test_github_user, you are signed in!"
  #   # Courtesy of: https://gist.github.com/ivanoats/7071730
  #   # with help from https://github.com/intridea/omniauth/wiki/Integration-Testing
  # end

  # # scenario "sign in with linkedin works" do
  #   visit new_user_session_path
  #   OmniAuth.config.test_mode = true
  #   Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
  #   Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:linkedin]
  #   OmniAuth.config.add_mock(:github,
  #                           {
  #                           uid: '12345',
  #                           info: { nickname: 'test_linkedin_user', email: 'test_linkedin_user@example.com'},
  #                           })
  #   click_on 'Sign in with linkedin'
  #   page.must_have_content "test_github_user, you are signed in!"
  #   # Courtesy of: https://gist.github.com/ivanoats/7071730
  #   # with help from https://github.com/intridea/omniauth/wiki/Integration-Testing
  # end

end
