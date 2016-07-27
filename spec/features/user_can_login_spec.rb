require 'rails_helper'

RSpec.feature "UserCanLogin", type: :feature do
  scenario "after they visit login page and create an account" do

    visit root_path

    click_on "Login"
    expect(current_path).to eq(login_path)

    click_on "Create New Account"

    fill_in "Username", with: "someguy"
    fill_in "Password", with: "password"

    click_on "Create Account"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as someguy.")
    expect(page).to have_no_content("Login")
    expect(page).to have_content("Logout")
  end

end
