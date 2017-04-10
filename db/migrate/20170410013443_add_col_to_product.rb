class AddColToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :img_src, :string
    add_column :products, :thumbnail, :string
  end
end
