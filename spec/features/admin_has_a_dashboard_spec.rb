require 'rails_helper'

RSpec.feature "AdminHasADashboard", type: :feature do
  scenario "they can visit their dashboard" do
    user = User.create(role: 1, username: "admin", password: "password")

    visit login_path

    fill_in "Username", with: "admin"
    fill_in "Password", with: "password"

    click_button "Login"

    expect(page).to have_content("Welcome, admin")
    expect(page).to have_content("Admin Dashboard")
    expect(current_path).to eq(admin_dashboard_path)
  end

  scenario "they can modify their own data" do
    user = User.create(role: 1, username: "admin", password: "password")

    visit login_path

    fill_in "Username", with: "admin"
    fill_in "Password", with: "password"

    click_button "Login"

    click_on "Edit Account"

    expect(current_path).to eq(edit_admin_user_path(user))
    expect(page).to have_content("Edit Account")

    fill_in "Username", with: "AdminMatt"
    fill_in "Password", with: "password"

    click_on "Update"

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("AdminMatt")
  end

  scenario "they cannot modify other user's data" do

  end
end
