class AddSkuToProductVariant < ActiveRecord::Migration
  def change
    add_column :product_variants, :sku, :string
    add_index :product_variants, :sku, unique: true
  end
end
