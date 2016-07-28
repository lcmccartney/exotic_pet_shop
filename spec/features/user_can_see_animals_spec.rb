require 'rails_helper'

RSpec.feature "UserCanSeeAnimals", type: :feature do
  scenario "within a specific category" do
    category = Category.create(name: "Big Cats")
    category.animals.create(name: "Tiger", description: "Stalker in the night", price: 3500, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")
    category.animals.create(name: "Lion", description: "Lazy during the day", price: 7000, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")

    visit '/big-cats'

    expect(page).to have_content("Tiger")
    expect(page).to have_content("Lion")
  end

  scenario "they see animal name and description after clicking on animal link" do
    category = Category.create(name: "Big Cats")
    animal = category.animals.create(name: "Tiger", description: "Stalker in the night", price: 3500, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")

    visit '/big-cats'

    click_on "Tiger"

    expect(current_path).to eq(animal_path(animal))
    expect(page).to have_content("Tiger")
    expect(page).to have_content("Stalker in the night")
  end

  scenario "they see index of all animals" do
    category = Category.create(name: "Big Cats")
    animal = category.animals.create(name: "Tiger", description: "Stalker in the night", price: 3500, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")

    visit categories_path

    click_on "All Animals"

    expect(current_path).to eq(animals_path)
    expect(page).to have_xpath("//img[@src='http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg']")
  end
end
