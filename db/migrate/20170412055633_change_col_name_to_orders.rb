class ChangeColNameToOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :delivery_cost, :decimal
    add_column :orders, :delivery_type, :string
  end
end
