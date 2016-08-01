require 'rails_helper'

RSpec.feature "UserCanAddAnimalToCarts", type: :feature do
  scenario "should display added to cart message and see cart count increase" do
    category = Category.create(name: "Big Cats")
    animal = category.animals.create(name: "Tiger", description: "Stalker in the night", price: 3500, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")

    visit animal_path(animal)

    expect(page).to have_content("Cart (0)")

    click_on "Add to Cart"

    expect(page).to have_content("1 Tiger in your cart")
    expect(page).to have_content("Cart (1)")

    click_on "Add to Cart"

    expect(page).to have_content("2 Tigers in your cart")
    expect(page).to have_content("Cart (2)")
  end

  scenario "should view animals in the cart" do
    category = Category.create(name: "Big Cats")
    animal = category.animals.create(
          name: "Tiger",
          description: "Stalker in the night",
          price: 3500,
          image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")

    visit animal_path(animal)

    click_on "Add to Cart"

    click_on "View Cart"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("Tiger")
    expect(page).to have_content("Stalker in the night")
    expect(page).to have_content(3500)
    expect(page).to have_xpath("//img[@src='http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg']")

  end
end
