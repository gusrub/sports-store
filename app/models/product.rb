class Product < ActiveRecord::Base

  include Concerns::Paginable

  belongs_to :category
  has_many :product_variants

  validates :category, presence: true
  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
  validates :description, presence: true

  scope :enabled, -> { where(enabled: true) }
  scope :featured, -> { where(featured: true) }

end
