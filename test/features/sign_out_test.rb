require 'test_helper'

feature 'All types users will have to ability to sign out' do

  scenario 'as an mentee I can sign out and be redirected to the home page' do
    sign_in_mentee
    click_link('Sign Out')
    current_path.must_equal splash_path
  end

  scenario 'as a mentor I can sign out and be redirected to the home page' do
    sign_in_mentor
    click_link('Sign Out')
    current_path.must_equal splash_path
  end

  scenario 'as an admin I can sign out and be redirected to the home page' do
    sign_in_admin
    click_link('Sign Out')
    current_path.must_equal splash_path
  end
end
