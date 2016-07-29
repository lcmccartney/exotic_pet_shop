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

  scenario "they can view a past order with order details" do
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

    click_on("View Order Details")

    expect(current_path).to eq(order_path(order))

    # Then I should see each item that was order with the quantity and line-item subtotals
    # And I should see links to each item's show page
    # And I should see the current status of the order (ordered, paid, cancelled, completed)
    # And I should see the total price for the order
    # And I should see the date/time that the order was submitted
    # If the order was completed or cancelled
    # Then I should see a timestamp when the action took place
  end
end
