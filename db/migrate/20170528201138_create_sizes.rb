class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :name
      t.string :code

      t.timestamps null: false
    end
    add_index :sizes, :name, unique: true
  end
end
