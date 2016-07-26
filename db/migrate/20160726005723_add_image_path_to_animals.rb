class AddImagePathToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :image_path, :string
  end
end
