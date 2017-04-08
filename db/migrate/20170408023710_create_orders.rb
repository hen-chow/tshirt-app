class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :delivery_cost, precision: 8, scale: 2
      t.string :delivery_address
      t.integer :cart_id

      t.timestamps
    end
  end
end
