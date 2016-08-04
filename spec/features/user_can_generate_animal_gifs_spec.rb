require 'rails_helper'

RSpec.feature "UserCanGenerateAnimalGifs", type: :feature do
  scenario "they can see a randomly generated animal gif" do
    visit secret_path

    expect(page).to have_content("Welcome")
    expect(page).to have_content("Generate Animal!")

    click_on("Generate Animal!")
    
    expect(page).to have_css("img")
    expect(current_path).to eq(secret_path)
  end
end
