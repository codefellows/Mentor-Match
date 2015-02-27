require 'test_helper'

feature 'A user must be able to sign in in a variety of ways' do

  before do
    visit root_path
    seed_db
  end

  scenario 'As a user I want to create a new mentor account ' do
    first(:link, 'Become a Mentor').click
    fill_in 'Email', with: users(:mentor_user).email
    fill_in 'First Name', with: 'Bruce'
    fill_in 'Last Name', with: 'Wayne'
    fill_in 'Password', with: 12_345_678
    fill_in 'user_password_confirmation', with: 12_345_678
    click_on 'Submit'
    page.must_have_content 'Create Account'
  end

  scenario 'Sign up with existing email will be sent back to create account' do
    first(:link, 'Find a Mentor').click
    fill_in 'Email', with: users(:mentee_user).email
    fill_in 'First Name', with: 'Robin'
    fill_in 'Last Name', with: 'Robin'
    fill_in 'Password', with: 12_345_678
    fill_in 'user_password_confirmation', with: 12_345_678
    click_on 'Submit'

    page.must_have_content 'Create Account'
  end

  scenario 'As a mentee, sign up and edit my profile' do
    first(:link, 'Find a Mentor').click
    fill_in 'Email', with: 'omg@omg.com'
    fill_in 'First Name', with: 'Robin'
    fill_in 'Last Name', with: 'Robin'
    fill_in 'Password', with: 12_345_678
    fill_in 'user_password_confirmation', with: 12_345_678
    fill_in 'Course', with: 'Ruby on Rails'
    click_on 'Submit'

    fill_in 'Technologies', with: 'Javascript, Ruby'
    fill_in 'Bio', with: 'I love candy'
    click_on 'Submit'
    first(:link, 'Home').click

    page.current_path.must_equal users_path
  end

  scenario 'signed in users are taken to their dashboard' do
    sign_in_mentee
    visit root_path
    page.current_path.must_equal users_path
  end
end
