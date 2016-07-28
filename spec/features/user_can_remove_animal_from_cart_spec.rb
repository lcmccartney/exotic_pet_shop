require 'rails_helper'

RSpec.feature "UserCanRemoveAnimalFromCart" do
  scenario "they see a message with link to animal and remove one animal" do
    category = Category.create(name: "Big Cats")
    animal = category.animals.create(name: "Tiger", description: "Stalker in the night", price: 3500, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")

    visit animal_path(animal)

    click_on "Add to Cart"
    click_on "Add to Cart"

    click_on "View Cart"

    expect(page).to have_content(7000)
    expect(page).to have_content("View Cart: 2")

    click_on "Remove"
    expect(current_path).to eq(cart_path)
    expect(page).to have_content(3500)
    expect(page).to have_content("View Cart: 1")

    expect(page).to have_content "Successfully removed Tiger from your cart."

    click_on "Remove"
    expect(page).to have_no_content(3500)
    expect(page).to have_content "Successfully removed Tiger from your cart."
    click_on "Tiger"

    expect(current_path).to eq(animal_path(animal))
  end
end
