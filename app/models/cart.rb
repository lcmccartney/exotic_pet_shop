class Cart
  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_animal(animal_id)
    contents[animal_id.to_s] ||= 0
    contents[animal_id.to_s] += 1
  end

  def total
    contents.values.sum
  end

  def count_of(animal_id)
    contents[animal_id.to_s]
  end
end
