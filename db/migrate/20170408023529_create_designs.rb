class CreateDesigns < ActiveRecord::Migration[5.0]
  def change
    create_table :designs do |t|
      t.string :name
      t.string :colour
      t.integer :length
      t.integer :width
      t.string :img_src
      t.boolean :predesign, default: true
      t.integer :user_id

      t.timestamps
    end
  end
end
