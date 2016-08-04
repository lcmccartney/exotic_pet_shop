require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:animals) }

  it "should return an array of all category names and ids" do
    big_cats = Category.create(name: "Big Cats")
    reptiles = Category.create(name: "Reptiles")
    result = Category.all_names

    expect(result).to eq [[big_cats.name, big_cats.id], [reptiles.name, reptiles.id]]
  end
end
