class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :colour
      t.string :size
      t.decimal :price, precision: 8, scale: 2
      t.integer :stock_level

      t.timestamps
    end
  end
end
