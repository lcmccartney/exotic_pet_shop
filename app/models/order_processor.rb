class OrderProcessor

  attr_reader :order, :cart

  def initialize(order, cart)
    @order = order
    @cart = cart
  end

  def add_animals_to_order
    @cart.cart_animals.each do |animal_order|
      @order.order_animals.create(
      order_id: @order.id,
      animal_id: animal_order.id,
      subtotal: animal_order.subtotal,
      quantity: animal_order.quantity
      )
    end
  end
end
