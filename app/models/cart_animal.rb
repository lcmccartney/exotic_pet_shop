class CartAnimal < SimpleDelegator
  attr_reader :animal, :quantity

  def initialize(id, quantity)
    @animal = Animal.find(id)
    @quantity = quantity
    super(@animal)
  end

  def subtotal
    quantity * price
  end
end
