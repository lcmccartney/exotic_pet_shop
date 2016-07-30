require 'rails_helper'

RSpec.feature "UserCanSeeRetiredItems", type: :feature do
   scenario "they can see animal page but cannot add to cart" do
     category = Category.create(name: "Big Cats")
     animal = category.animals.create(name: "Tiger", status: 1, description: "Stalker in the night", price: 3500, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")

     visit "/animals/#{animal.id}"

     expect(page).to have_no_content("Add to Cart")
     expect(page).to have_content("Extinct")
   end
end
