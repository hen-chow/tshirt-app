class AddColumnsToLineItems < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :top, :integer
    add_column :line_items, :left, :integer
    add_column :line_items, :width_ratio, :decimal
    add_column :line_items, :height_ratio, :decimal
  end
end
