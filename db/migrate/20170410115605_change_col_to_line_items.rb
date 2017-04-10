class ChangeColToLineItems < ActiveRecord::Migration[5.0]
  def change
    change_column :line_items, :qty, :integer, default: 1
  end
end
