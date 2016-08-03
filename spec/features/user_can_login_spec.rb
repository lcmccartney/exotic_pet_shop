require 'rails_helper'

RSpec.feature "UserCanLogin", type: :feature do
  scenario "they visit login page, create an account, and see dashboard" do

    visit root_path

    click_on "Login"
    expect(current_path).to eq(login_path)

    click_on "Create New Account"

    fill_in "Username", with: "someguy"
    fill_in "Password", with: "password"

    click_on "Create Account"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as someguy")
    expect(page).to have_no_content("Login")
    expect(page).to have_content("Logout")
  end

  scenario "with an existing account" do

    user = User.create(username: "someguy", password: "password")

    visit root_path

    click_on "Login"

    expect(current_path).to eq(login_path)


    fill_in "Username", with: "someguy"
    fill_in "Password", with: "password"

    click_button "Login"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as someguy")
  end

  scenario "can click on Logout and end their session" do
    #use rspec login method
    user = User.create(username: "someguy", password: "password")

    visit root_path

    click_on "Login"

    expect(current_path).to eq(login_path)


    fill_in "Username", with: "someguy"
    fill_in "Password", with: "password"

    click_button "Login"

    click_on "Logout"

    expect(page).to have_no_content("Logged in as someguy")
    expect(page).to have_content("Login")
    expect(page).to have_no_content("Logout")
  end

  scenario "they login from cart page with animals and redirect to cart" do
    user = User.create(username: "someguy", password: "password")
    category = Category.create(name: "Big Cats")
    tiger = category.animals.create(id: "1", name: "Tiger", description: "Stalker in the night", price: 3000, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")

    visit "/animals/#{tiger.id}"

    click_on "Add to Cart"

    visit cart_path

    click_on "Login or Create Account to Checkout"

    fill_in "Username", with: "someguy"
    fill_in "Password", with: "password"

    click_button "Login"

    expect(current_path).to eq(cart_path)
  end

  scenario "they cannot login with invalid username" do
    user = User.create(username: "someguy", password: "password")

    visit root_path

    click_on "Login"

    expect(current_path).to eq(login_path)


    fill_in "Username", with: "thisguy"
    fill_in "Password", with: "password"

    click_button "Login"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Invalid login")
  end

  scenario "they cannot login with invalid password" do
    user = User.create(username: "someguy", password: "password")

    visit root_path

    click_on "Login"

    expect(current_path).to eq(login_path)


    fill_in "Username", with: "someguy"
    fill_in "Password", with: "word"

    click_button "Login"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Invalid login")
  end

end
