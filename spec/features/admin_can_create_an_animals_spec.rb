require 'rails_helper'

RSpec.feature "AdminCanCreateAnAnimals", type: :feature do
  scenario "and they can see the individual animal page" do
    user = User.create(role: 1, username: "admin", password: "password")
    Category.create(name: "Big Cats")
    Category.create(name: "Reptiles")

    visit login_path

    fill_in "Username", with: "admin"
    fill_in "Password", with: "password"

    click_button("Login")

    expect(current_path).to eq(admin_dashboard_path)
    click_on("Create an Animal")

    expect(current_path).to eq(new_animal_path)
    fill_in "Name", with: "Cougar"
    fill_in "Description", with: "Active in the day"
    fill_in "Price", with: 9000
    fill_in "Image path", with: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Puma_face.jpg/800px-Puma_face.jpg"
    select "Big Cats"
    click_on "Create"
    animal = Animal.last
    expect(current_path).to eq(new_animal_path)
    expect(page).to have_content("Successfully created #{animal.name}")

    visit animal_path(animal)

    expect(current_path).to eq(animal_path(animal))
    expect(page).to have_content("Cougar")
    expect(page).to have_content("Active in the day")
    expect(page).to have_content('9,000')
    expect(animal.category.name).to eq("Big Cats")
  end

  scenario "they leave image path blank and still see an image" do
    user = User.create(role: 1, username: "admin", password: "password")
    Category.create(name: "Big Cats")
    Category.create(name: "Reptiles")

    visit login_path

    fill_in "Username", with: "admin"
    fill_in "Password", with: "password"

    click_button("Login")

    expect(current_path).to eq(admin_dashboard_path)
    click_on("Create an Animal")

    expect(current_path).to eq(new_animal_path)
    fill_in "Name", with: "Cougar"
    fill_in "Description", with: "Active in the day"
    fill_in "Price", with: 9000
    select "Big Cats"
    click_on "Create"
    animal = Animal.last
    expect(current_path).to eq(new_animal_path)
    expect(page).to have_content("Successfully created #{animal.name}")

    visit animal_path(animal)

    expect(current_path).to eq(animal_path(animal))
    expect(page).to have_content("Cougar")
    expect(page).to have_content("Active in the day")
    expect(page).to have_content('9,000')
    expect(animal.category.name).to eq("Big Cats")
    expect(page).to have_xpath("//img[@src='https://s-media-cache-ak0.pinimg.com/564x/13/05/6d/13056dae918b65e94c7d36e885c30398.jpg']")

  end
end
