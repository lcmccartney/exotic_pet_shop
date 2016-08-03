class Animal < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image_path, presence: true
  validates_numericality_of :price, greater_than: 0
  validates :category_id, presence: true
  enum status: %w[active extinct]

  belongs_to :category
  has_many :order_animals
  has_many :orders, through: :order_animals

  def default_image
    "https://s-media-cache-ak0.pinimg.com/564x/13/05/6d/13056dae918b65e94c7d36e885c30398.jpg"
  end
end
