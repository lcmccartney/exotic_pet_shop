require 'rails_helper'

RSpec.feature "UserCanViewPastOrders", type: :feature do
  scenario "they can see past orders as a logged in user" do
    user = User.create(username: "someguy", password: "password")
    order = user.orders.create
    visit login_path

    fill_in "Username", with: "someguy"
    fill_in "Password", with: "password"

    click_button "Login"

    expect(page).to have_content("Welcome, someguy")

    visit orders_path

    expect(page).to have_content("Past Orders")
    expect(page).to have_content(order.id)
  end

  scenario "they are redirected to login page if they are not logged in" do
    visit orders_path

    expect(page).to have_no_content("Past Orders")
    expect(page).to have_content("Please log in or create an account.")
  end
end
