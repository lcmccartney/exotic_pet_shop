require 'rails_helper'

RSpec.feature "UserCanOnlyViewOwnData", type: :feature do
  scenario "they cannot view another user's private data" do

    user1 = User.create(username: "someguy", password: "password")
    order1 = user1.orders.create(id: 1, status: "ordered", total_price: 7000)

    user2 = User.create(username: "someotherguy", password: "password")
    order2 = user2.orders.create(id: 2, status: "ordered", total_price: 10000)

    visit login_path

    fill_in "Username", with: "someguy"
    fill_in "Password", with: "password"

    click_button "Login"

    expect(page).to have_content("Welcome, someguy")

    visit orders_path
    click_on("View Order Details")

    expect(page).to have_content('7,000')
    expect(page).to have_no_content('10,000')
  end

  scenario "they cannot view another user's private data" do
    user = User.create(username: "someguy", password: "password")
    visit login_path

    fill_in "Username", with: "someguy"
    fill_in "Password", with: "password"

    click_button "Login"

    visit admin_dashboard_path

    expect(page).to have_content("404")

  end

  scenario "they cannot view any admin capablities" do
    user = User.create(username: "someguy", password: "password")

    visit login_path

    fill_in "Username", with: "someguy"
    fill_in "Password", with: "password"

    click_button "Login"

    visit admin_dashboard_path

    expect(page).to have_content("404")
  end
end
