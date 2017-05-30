class AddPictureToProductVariants < ActiveRecord::Migration
  def change
    add_column :product_variants, :picture, :string
  end
end
