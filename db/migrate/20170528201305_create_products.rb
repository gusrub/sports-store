class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :category, index: true, foreign_key: true
      t.string :sku
      t.boolean :enabled

      t.timestamps null: false
    end
    add_index :products, :sku, unique: true
  end
end
