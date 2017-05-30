class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :colors, :name, unique: true
  end
end
