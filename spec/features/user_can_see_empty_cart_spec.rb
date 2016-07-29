require 'rails_helper'

RSpec.feature "UserCanSeeEmptyCart" do
  scenario "they see a message with link to add animals to cart" do
    category = Category.create(name: "Big Cats")
    animal = category.animals.create(name: "Tiger", description: "Stalker in the night", price: 3500, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")

    visit cart_path

    expect(page).to have_content("View Cart: 0")

    expect(page).to have_content "Your cart is empty."

    click_on "Add some animals!"

    expect(current_path).to eq(animals_path)
  end
end
