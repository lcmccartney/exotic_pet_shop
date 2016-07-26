class Category < ActiveRecord::Base

  before_validation :create_slug

  validates :slug, presence: true, uniqueness: { case_senstive: false }

  has_many :animals

private

  def create_slug
    self.slug = name.parameterize
  end

  def to_param
    slug
  end

end
