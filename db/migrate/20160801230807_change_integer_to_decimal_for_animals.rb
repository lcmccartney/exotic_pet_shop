class ChangeIntegerToDecimalForAnimals < ActiveRecord::Migration
  def change
    change_column :animals, :price, :decimal
  end
end
