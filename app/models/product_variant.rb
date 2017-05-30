class ProductVariant < ActiveRecord::Base

  include Concerns::Paginable

  belongs_to :product
  belongs_to :size
  belongs_to :color

  mount_uploader :picture, PictureUploader

  validates :product, presence: true
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :discount, numericality: { greater_than_or_equal_to: 0 }
  validates :sku, presence: true, uniqueness: true

  before_validation :set_final_price

  scope :enabled, -> { joins(:product).where(products: {enabled: true}) }
  scope :search, ->(term) { joins(:product).where("products.name ILIKE ? OR products.description ILIKE ?", "%#{term}%", "%#{term}%") }
  scope :by_category, ->(category_id) { joins(:product).where(products: {category_id: category_id}) }

  private

  def set_final_price
    if discount > 0
      self.final_price = (price - (price * discount.to_f / 100)).round(2)
    else
      self.final_price = price   
    end
  end

end
