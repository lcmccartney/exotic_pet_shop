class AddStatusToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :status, :integer, default: 0
  end
end
