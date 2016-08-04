require 'rails_helper'

RSpec.describe OrderProcessor, type: :model do
  it "should initialize with an order and cart" do
    cart = Cart.new("1" => 2, "2" => 3)
    order = Order.new(total_price: 1000)
    op = OrderProcessor.new(order, cart)
    op_cart = op.cart
    op_order = op.order

    expect(op_cart).to be_a Cart
    expect(op_order).to be_a Order
  end
end
