class ChangePriceForAnimals < ActiveRecord::Migration
  def change
    change_column :animals, :price, :integer
  end
end
