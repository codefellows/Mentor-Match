require "test_helper"

feature "user policy is enforced" do

  before do
    sign_in_mentor
  end

  scenario "user can edit their own profile" do
    click_on "settings"
    click_on "Edit"
    assert_content "Sweet! Your seconds away from the roster."
  end

  scenario "user cannot edit other user's profile" do
    click_on "Browse"
    page.first(:link, "View Details").click
    refute_css "#edit"
  end
end
