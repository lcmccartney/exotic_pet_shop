require 'rails_helper'

RSpec.feature "GuestUserCanAddToCart", type: :feature do
  scenario "can create account and still see animals in cart" do
    category = Category.create(name: "Big Cats")
    animal = category.animals.create(name: "Tiger", description: "Stalker in the night", price: 3500, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")

    visit "/animals/#{animal.id}"
    click_on "Add to Cart"
    visit cart_path

    expect(page).to have_content("Tiger")
    expect(page).to have_content("Login")

    click_on "Login or Create Account to Checkout"

    expect(current_path).to eq(login_path)

    click_on "Create New Account"
    fill_in "Username", with: "someguy"
    fill_in "Password", with: "password"
    click_on "Create Account"
    visit cart_path

    expect(page).to have_content("Tiger")

    click_on "Logout"

    expect(page).to have_content("Login")
    expect(page).to have_no_content("Logout")
  end
end
