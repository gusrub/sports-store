class AddDiscountToProductVariants < ActiveRecord::Migration
  def change
    add_column :product_variants, :discount, :decimal, default: 0
  end
end
