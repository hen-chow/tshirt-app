class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.integer :product_id
      t.integer :design_id
      t.integer :qty
      t.integer :cart_id

      t.timestamps
    end
  end
end
