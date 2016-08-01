class CreateOrderAnimals < ActiveRecord::Migration
  def change
    create_table :order_animals do |t|
      t.references :order, index: true, foreign_key: true
      t.references :animal, index: true, foreign_key: true
      t.integer :subtotal
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
