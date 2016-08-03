require 'rails_helper'

RSpec.feature "AdminCanEditExistingAnimals", type: :feature do
  scenario "they should be able to see updated animal" do
    user = User.create(role: 1, username: "admin", password: "password")
    big_cats = Category.create(name: "Big Cats")
    Category.create(name: "Reptiles")
    animal = big_cats.animals.create(
      name: "Tiger",
      description: "Stalker in the night",
      price: 3500,
      image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg"
    )

    visit login_path

    fill_in "Username", with: "admin"
    fill_in "Password", with: "password"

    click_button "Login"

    visit admin_animals_path

    click_on "Tiger"

    expect(current_path).to eq(edit_admin_animal_path(animal))
    fill_in "Name", with: "Lion"
    fill_in "Description", with: "Lazy in the day"
    fill_in "Price", with: 11000
    fill_in "Image path", with: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg"
    select "extinct"
    select "Reptiles"

    click_button "Submit"

    expect(current_path).to eq(admin_animals_path)
    expect(page).to have_content("Successfully updated!")

    visit '/reptiles'
    expect(page).to have_content("Lion")
  end
end
