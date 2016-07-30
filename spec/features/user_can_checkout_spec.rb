require 'rails_helper'

RSpec.feature "UserCanCheckout", type: :feature do
  xscenario "when on cart page" do
    category = Category.create(name: "Big Cats")
    tiger = category.animals.create(id: "1", name: "Tiger", description: "Stalker in the night", price: 3000, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")
    lion = category.animals.create(id: "2", name: "Lion", description: "Lazy during the day", price: 7000, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")
    user = User.create(username: "someguy", password: "password")
    order = user.orders.create(status: "ordered")

    visit "/animals/#{tiger.id}"

    click_on "Add to Cart"

    visit cart_path

    click_on "+"

    expect(page).to have_content(6000)

    visit "/animals/#{lion.id}"

    click_on "Add to Cart"

    visit cart_path

    expect(page).to have_content(7000)
    expect(page).to have_content(13000)

    click_on "Login or Create Account to Checkout"

    fill_in "Username", with: "someguy"
    fill_in "Password", with: "password"

    click_button "Login"

    expect(current_path).to eq(cart_path)

    visit orders_path

    expect(page).to have_content("You have no orders")

    visit cart_path

    click_on "Checkout"

    expect(current_path).to eq(orders_path)

    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_content("View Order Details")
  end
end


# Background: An existing user and a cart with items
# As a visitor
# When I add items to my cart
# And I visit "/cart"
# And I click "Login or Register to Checkout"
# Then I should be required to login
# When I am logged in I should be taken back to my cart


# And when I click "Checkout"
# Then the order should be placed
# And my current page should be "/orders"
# And I should see a message "Order was successfully placed"
# And I should see the order I just placed in a table
