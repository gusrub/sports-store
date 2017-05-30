class AddFinalPriceToProductVariant < ActiveRecord::Migration
  def change
    add_column :product_variants, :final_price, :decimal
  end
end
