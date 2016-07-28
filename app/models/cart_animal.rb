class CartAnimal < SimpleDelegator

  def initialize(id, quantity)
    @animal = Animal.find(id)
    @quantity = quantity
    super(@animal)
  end
end


ca = CartAnimal.new("3", 5)
ca.name
