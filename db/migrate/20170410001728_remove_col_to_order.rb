class RemoveColToOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :cart_id, :integer
  end
end
