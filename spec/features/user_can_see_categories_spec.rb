require 'rails_helper'

RSpec.feature "UserCanSeeCategories", type: :feature do
  scenario "should display list of categories" do
    category = Category.create(name: "Big Cats")

    visit categories_path

    expect(page).to have_content("Big Cats")
  end
end
