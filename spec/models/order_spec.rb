require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should have_many(:order_animals) }
  it { should have_many(:animals) }
  it { should define_enum_for(:status) }

  it "should check whether an order is completed or cancelled" do
    ordered = Order.create(status: 0)
    paid = Order.create(status: 1)
    cancelled = Order.create(status: 2)
    completed = Order.create(status: 3)

    expect(ordered.closed?).to eq(false)
    expect(paid.closed?).to eq(false)
    expect(cancelled.closed?).to eq(true)
    expect(completed.closed?).to eq(true)
  end
end
