class RemoveColourToDesign < ActiveRecord::Migration[5.0]
  def change
    remove_column :designs, :colour, :string
  end
end
