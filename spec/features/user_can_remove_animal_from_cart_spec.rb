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
    click_on "Remove"

    expect(current_path).to eq(cart_path)
    expect(page).to have_content(3500)
    expect(page).to have_content "Successfully removed Tiger from your cart."

    click_on "Tiger"

    expect(current_path).to eq(animal_path(animal))
  end
  # expect(current_page).to_not have_content "Stalker in the night"
  # expect(current_page).to_not have_content "Stalker in the night"

end
#   As a visitor
# When I visit "/cart"
# And I click link "Remove Animal"
# Then my current page should be "/cart"
# And I should see a message styled in green
# And the message should say "Successfully removed SOME_ANIMAL from your cart."
# And the title "SOME_ANIMAL" should be a link to that item in case the user wants to add it back
# And I should not see the item listed in cart"
