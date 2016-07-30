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
end
