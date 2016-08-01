class Animal < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates_numericality_of :price, greater_than: 0
  validates :image_path, presence: true
  validates :category_id, presence: true
  enum status: %w[active extinct]

  belongs_to :category
  has_many :order_animals
  has_many :orders, through: :order_animals
end
