require 'rails_helper'

RSpec.feature "UserCanAddAnimalToCarts", type: :feature do
  scenario "should display added to cart message and see cart count increase" do
    category = Category.create(name: "Big Cats")
    animal = category.animals.create(name: "Tiger", description: "Stalker in the night", image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")

    visit animal_path(animal)

    expect(page).to have_content("Cart: 0")

    click_on "Add to Cart"

    expect(page).to have_content("1 Tiger in your cart")
    expect(page).to have_content("Cart: 1")

    click_on "Add to Cart"

    expect(page).to have_content("2 Tigers in your cart")
    expect(page).to have_content("Cart: 2")
  end

  
end
