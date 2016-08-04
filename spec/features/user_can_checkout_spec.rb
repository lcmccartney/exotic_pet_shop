require 'rails_helper'

RSpec.feature "UserCanCheckout", type: :feature do
  scenario "when on cart page" do
    category = Category.create(name: "Big Cats")
    tiger = category.animals.create(id: "1", name: "Tiger", description: "Stalker in the night", price: 3000, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")
    lion = category.animals.create(id: "2", name: "Lion", description: "Lazy during the day", price: 7000, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")
    user = User.create(username: "someguy", password: "password")

    visit "/animals/#{tiger.id}"

    click_on "Add to Cart"

    visit cart_path

    click_on "+"

    expect(page).to have_content('6,000')

    visit "/animals/#{lion.id}"

    click_on "Add to Cart"

    visit cart_path

    expect(page).to have_content('7,000')
    expect(page).to have_content('13,000')

    click_on "Login or Create Account to Checkout"

    fill_in "Username", with: "someguy"
    fill_in "Password", with: "password"

    click_button "Login"

    expect(current_path).to eq(cart_path)

    visit orders_path

    expect(page).to have_no_content("View Order Details")

    visit cart_path

    click_on "Checkout"

    expect(current_path).to eq(order_path(Order.last))

    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_content("Tiger")
    expect(page).to have_content("Lion")
  end
end
