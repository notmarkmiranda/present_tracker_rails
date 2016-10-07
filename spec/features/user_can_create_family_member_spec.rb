require "rails_helper"

RSpec.feature "family member creation", type: feature do
  before do
    user = User.create(email: "test@example.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  scenario "from the dashboard path" do
    visit '/dashboard'
    click_link "create new family member"

    fill_in "first name", with: "Holly"
    fill_in "last name", with: "Miranda"
    page.find("#birthdate").set("1980-07-14")

    fill_in "relationship", with: "Wife"
    click_button "Create!"

    expect(page).to have_content("New Person Created!")
    expect(page).to have_content("Name: Holly Miranda")
    expect(page).to have_content("Birthdate: July 14, 1980")
    expect(page).to have_content("Relationship: Wife")
  end

  scenario "doesn't create fm without all data - first sad path" do
    visit "/dashboard"
    click_link "create new family member"

    fill_in "first name", with: "Holly"
    page.find("#birthdate").set("1980-07-14")

    fill_in "relationship", with: "Wife"
    click_button "Create!"

    expect(page).to have_content("something went wrong!")
  end

  scenario "doesn't create fm without all data - second sad path" do
    visit "/dashboard"
    click_link "create new family member"

    fill_in "last name", with: "Miranda"
    page.find("#birthdate").set("1980-07-14")

    fill_in "relationship", with: "Wife"
    click_button "Create!"

    expect(page).to have_content("something went wrong!")
  end
end
