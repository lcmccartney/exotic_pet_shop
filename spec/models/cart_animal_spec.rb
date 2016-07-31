require 'rails_helper'

RSpec.describe CartAnimal, type: :model do

  before :each do
    category = Category.create(name: "Big Cats")
    category.animals.create(id: "1", name: "Tiger", description: "Stalker in the night", price: 3500, image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg")
    @cart_animal = CartAnimal.new("1", 2)
  end

  it "should find an animal" do
    expect(@cart_animal.animal.name).to eq("Tiger")
  end

  it "should find a quantity" do
    expect(@cart_animal.quantity).to eq(2)
  end

  it "should calculate a subtotal" do
    expect(@cart_animal.subtotal).to eq(7000)
  end
end
