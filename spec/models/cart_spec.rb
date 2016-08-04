require 'rails_helper'

RSpec.describe "cart", type: :model do
  it "should have initial contents" do
    cart = Cart.new("1" => 2)

    expect(cart.contents).to eq("1" => 2)
  end

  it "should have an empty hash as contents if no session cart" do
    cart = Cart.new(nil)

    expect(cart.contents).to eq({})
  end

  it "should be able to add an animal to the cart" do
    cart = Cart.new("1" => 2)
    cart.increase_animal(1)
    cart.increase_animal(2)

    expect(cart.contents).to eq("1" => 3, "2" => 1)
  end

  it "should be able to calcultate a total" do
    cart = Cart.new("1" => 2, "2" => 3)

    expect(cart.total).to eq(5)
  end

  it "should give a count of specific animal in cart" do
    cart = Cart.new("1" => 2, "2" => 3)

    expect(cart.count_of(1)).to eq(2)
  end

  it "should return cart animals objects" do
    category = Category.create(name: "Big Cats")
    category.animals.create(id: "1", name: "Tiger", description: "Stalker in the night", price: 3500, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")
    category.animals.create(id: "2", name: "Lion", description: "Lazy during the day", price: 7000, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")
    cart = Cart.new("1" => 2, "2" => 3)
    cart_animal = cart.cart_animals

    expect(cart_animal.first).to be_an_instance_of CartAnimal
  end

  it "should return the total price of all animals" do
    category = Category.create(name: "Big Cats")
    category.animals.create(id: "1", name: "Tiger", description: "Stalker in the night", price: 3500, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")
    category.animals.create(id: "2", name: "Lion", description: "Lazy during the day", price: 7000, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")
    cart = Cart.new("1" => 2, "2" => 3)
    
    expect(cart.total_price).to eq(28000)
  end
end
