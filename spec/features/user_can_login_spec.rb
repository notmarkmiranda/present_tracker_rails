require "rails_helper"

RSpec.feature "user login", type: feature do
  before do
    @user = User.create(email: "test@example.com", password: "password")
  end

  scenario "registered user can login" do
    visit "/"
    click_link "Log In"

    fill_in "e-mail", with: @user.email
    fill_in "password", with: "password"
    click_button "let's go!"

    expect(page).to have_content("you're logged in!")
  end
end
