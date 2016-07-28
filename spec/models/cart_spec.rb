require 'rails_helper'

RSpec.describe "cart", type: :model do
  it "should have initial contents" do
    cart = Cart.new({"1" => 2})

    expect(cart.contents).to eq({"1" => 2})
  end

  it "should have an empty hash as contents if no session cart" do
    cart = Cart.new(nil)

    expect(cart.contents).to eq({})
  end

  it "should be able to add an animal to the cart" do
    cart = Cart.new({"1" => 2})

    cart.increase_animal(1)
    cart.increase_animal(2)

    expect(cart.contents).to eq({"1" => 3, "2" => 1})
  end

  it "should be able to calcultate a total" do
    cart = Cart.new({"1" => 2, "2" => 3})

    expect(cart.total).to eq(5)
  end

  it "should give a count of specific animal in cart" do
    cart = Cart.new({"1" => 2, "2" => 3})

    expect(cart.count_of(1)).to eq(2)
  end
end
