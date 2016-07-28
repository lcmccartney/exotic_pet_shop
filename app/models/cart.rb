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

  # def cart_animals
  #   contents.map do |id, quantity|
  #     CartAnimal.new(id, quantity)
  #   end
  # end

  def count_of(animal_id)
    contents[animal_id.to_s]
  end

  def total_price
    total = contents.map do |animal_id, quantity|
      Animal.find(animal_id.to_i).price * count_of(animal_id)
    end
    total.sum
  end
end
