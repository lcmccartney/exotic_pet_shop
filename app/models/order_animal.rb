class OrderAnimal < ActiveRecord::Base
  belongs_to :order
  belongs_to :animal
end
