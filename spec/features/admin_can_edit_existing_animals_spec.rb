require 'rails_helper'

RSpec.feature "AdminCanEditExistingAnimals", type: :feature do
  scenario "they should be able to see updated animal" do
    user = User.create(role: 1, username: "admin", password: "password")
    category = Category.create(name: "Big Cats")
    animal = category.animals.create(name: "Tiger", description: "Stalker in the night", price: 3500, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")

    visit login_path

    fill_in "Username", with: "admin"
    fill_in "Password", with: "password"

    click_button "Login"

    visit admin_animals_path

    click_on "Edit"

    expect(current_path).to eq(edit_admin_animal_path(animal))
    fill_in "Name", with: "Lion"
    fill_in "Description", with: "Lazy in the day"
    fill_in "Price", with: 11000
    fill_in "Image path", with: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg"
    select "extinct"

    click_button "Update"

    expect(current_path).to eq(admin_animals_path)
    expect(page).to have_content("Successfully updated!")
  end
end


# Background: an existing item
# As an admin
# When I visit "admin/items"
# And I click "Edit"
# Then my current path should be "/admin/items/:ITEM_ID/edit"
# And I should be able to upate title, description, image, and status
