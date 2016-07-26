class AddPriceToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :price, :decimal
  end
end
