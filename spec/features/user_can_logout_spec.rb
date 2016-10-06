require "rails_helper"

RSpec.feature "user log out", type: feature do
  before do
    user = User.create(email: "test@example.com", password: "password")
    visit "/login"
    fill_in "e-mail", with: user.email
    fill_in "password", with: "password"
    click_button "let's go!"
  end

  scenario "logged in user can log out" do
    visit "/"

    expect(page).to_not have_link("Log In")
    expect(page).to have_link("Log Out")

    click_link "Log Out"

    expect(page).to have_content("logged out!")
  end
end
