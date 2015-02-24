require 'test_helper'

feature 'As a mentor, I want to edit my profile' do
  scenario 'should edit name, bio, company, and position', js: true do
    sign_in_mentor
    visit edit_user_path(users(:mentor_user))

    fill_in 'First name', with: 'Coolio'
    fill_in 'Last name', with: 'Iceman'
    fill_in 'Bio', with: 'Coolest developer ever...'
    fill_in 'Position', with: 'Super developer'
    fill_in 'Company', with: 'Developer Central'
    click_on 'Submit'

    page.current_path.must_equal user_path users(:mentor_user)
    page.must_have_content 'Coolio'
    page.must_have_content 'Iceman'
    page.must_have_content 'Coolest developer ever...'
    page.must_have_content 'Super developer'
    page.must_have_content 'Developer Central'
  end
end

feature 'As a mentee, I want to edit my profile' do
  scenario 'should edit name, bio, technologies' do
    sign_in_mentee
    visit edit_user_path(users(:mentee_user))

    fill_in 'First name', with: 'Bobby'
    fill_in 'Last name', with: 'Joebob'
    fill_in 'Bio', with: 'Studying JavaScript Full Stack!'
    fill_in 'Technologies', with: 'JavaScript, AngularJS, Node.js'
    fill_in 'Hopes for mentorship', with: 'I want a nice mentor'
    fill_in 'Hopes for my professional future', with: 'Join Square'
    click_on 'Submit'

    page.current_path.must_equal user_path users(:mentee_user)
    page.must_have_content 'Bobby'
    page.must_have_content 'Joebob'
    page.must_have_content 'Studying JavaScript Full Stack!'
    page.must_have_content 'JavaScript, AngularJS, Node.js'
    page.must_have_content 'I want a nice mentor'
    page.must_have_content 'Join Square'
  end
end
