class RemoveOrderIdtoCart < ActiveRecord::Migration[5.0]
  def change
    remove_column :carts, :order_id, :integer
  end
end
