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
    expect(page).to have_content("Logged in as someguy")
    expect(page).to have_no_content("Login")
    expect(page).to have_content("Logout")
  end

  scenario "with an existing account" do

    user = User.create(username: "someguy", password: "password")

    visit root_path

    click_on "Login"

    expect(current_path).to eq(login_path)


    fill_in "Username", with: "someguy"
    fill_in "Password", with: "password"

    click_button "Login"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as someguy")
  end

  scenario "can click on Logout and end their session" do
    #use rspec login method
    user = User.create(username: "someguy", password: "password")

    visit root_path

    click_on "Login"

    expect(current_path).to eq(login_path)


    fill_in "Username", with: "someguy"
    fill_in "Password", with: "password"

    click_button "Login"

    click_on "Logout"

    expect(page).to have_no_content("Logged in as someguy")
    expect(page).to have_content("Login")
    expect(page).to have_no_content("Logout")
  end
end
