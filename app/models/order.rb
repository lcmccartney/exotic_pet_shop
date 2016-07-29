class Order < ActiveRecord::Base
  has_many :order_animals
  has_many :animals, through: :order_animals
end
