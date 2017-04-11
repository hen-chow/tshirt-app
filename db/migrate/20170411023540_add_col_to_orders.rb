class AddColToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :pay_type, :string
  end
end
