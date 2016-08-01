class Order < ActiveRecord::Base
  has_many :order_animals
  has_many :animals, through: :order_animals
  enum status: %w[ordered paid cancelled completed]

  def closed?
    status == "completed" || status == "cancelled"
  end
end
