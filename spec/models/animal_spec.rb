require 'rails_helper'

RSpec.describe Animal, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:image_path) }
  it { should have_many(:order_animals) }
  it { should have_many(:orders) }
  it { should belong_to(:category) }
  it { should define_enum_for(:status) }

  it "should check whether animal is extinct" do
    category = Category.create(name: "Big Cats")
    animal_1 = category.animals.create(
      name: "Tiger",
      status: 1,
      description: "Stalker in the night",
      price: 3500,
      image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg"
    )

    extinct_animal = animal_1.extinct?
    expect(extinct_animal).to eq(true)

    animal_2 = category.animals.create(
      name: "Tiger",
      status: 0,
      description: "Stalker in the night",
      price: 3500,
      image_path: "http://wildaid.org/sites/default/files/photos/iStock_000008484745Large%20%20tiger%20-%20bengal.jpg"
    )

    active_animal = animal_2.extinct?
    expect(active_animal).to eq(false)
  end
end
