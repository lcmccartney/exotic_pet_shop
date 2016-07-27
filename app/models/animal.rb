class Animal < ActiveRecord::Base

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image_path, presence: true

  belongs_to :category
end
