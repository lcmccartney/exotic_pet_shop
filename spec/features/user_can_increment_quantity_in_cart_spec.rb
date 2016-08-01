require 'rails_helper'

RSpec.feature "UserCanIncrementQuantityInCart", type: :feature do
  scenario "and see the animal quantity adjust" do
    category = Category.create(name: "Big Cats")
    animal = category.animals.create(name: "Tiger", description: "Stalker in the night", price: 3500, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")

    visit animal_path(animal)

    click_on "Add to Cart"

    click_on "View Cart"

    expect(page).to have_content("View Cart (1)")
    click_on "+"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("View Cart (2)")
    expect(page).to have_content("Successfully added Tiger!")
    click_on "-"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("View Cart (1)")
    expect(page).to have_content("Successfully removed Tiger from your cart.")
  end
end
