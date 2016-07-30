class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def increase_animal(animal_id)
    contents[animal_id.to_s] ||= 0
    contents[animal_id.to_s] += 1
  end

  def decrease_animal(animal_id)
    contents[animal_id.to_s] -= 1
    contents.delete_if{ |key, value| value == 0}
  end

  def remove_animal(animal_id)
    contents.delete_if{ |key, value| key == animal_id.to_s}
  end

  def total
    contents.values.sum
  end

  def cart_animals
    contents.map do |id, quantity|
      CartAnimal.new(id, quantity)
    end
  end

  def count_of(animal_id)
    contents[animal_id.to_s]
  end

  # def price_per_animal(animal_id)
  #   find_animal(animal_id).price * find_animal(animal_id).quantity
  # end.sum

  # def find_animal(animal_id)
  #   cart_animals.find(animal_id)
  # end

  def total_price
    cart_animals.map do |animal|
      animal.price * animal.quantity
    end.sum
  end

end
