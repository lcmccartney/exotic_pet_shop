require 'rails_helper'

RSpec.feature "GuestCannotViewUnauthorizedPages", type: :feature do

    scenario "they cannot view another user's private data" do
      visit admin_dashboard_path

      expect(page).to have_content("404")

    end

    scenario "they cannot view any admin capablities" do
      visit admin_dashboard_path

      expect(page).to have_content("404")
    end

    scenario "they cannot view an orders page" do
      visit orders_path

      expect(page).to have_content("Please log in or create an account.")
    end

    scenario "they cannot view a specific order page" do
      user = User.create(username: "someotherguy", password: "password")
      order = user.orders.create(id: 2, status: "ordered", total_price: 10000)

      visit order_path(order)

      expect(page).to have_content("Please log in or create an account.")
    end

  end
