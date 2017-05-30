class CreateProductVariants < ActiveRecord::Migration
  def change
    create_table :product_variants do |t|
      t.references :product, index: true, foreign_key: true
      t.references :size, index: true, foreign_key: true
      t.references :color, index: true, foreign_key: true
      t.integer :stock
      t.decimal :price

      t.timestamps null: false
    end
  end
end
