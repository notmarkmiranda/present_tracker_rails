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

  scenario "cannot log in with invalid email" do
    visit "/"
    click_link "Log In"

    fill_in "e-mail", with: "tests@example.com"
    fill_in "password", with: "password"
    click_button "let's go!"

    expect(page).to have_content("something went wrong!")
  end

  scenario "cannot log in with invalid password" do
    visit "/"
    click_link "Log In"

    fill_in "e-mail", with: "test@example.com"
    fill_in "password", with: "pssword"
    click_button "let's go!"

    expect(page).to have_content("something went wrong!")

  end
end
