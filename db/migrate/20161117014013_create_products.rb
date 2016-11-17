class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.float :cost
      t.float :sell_price
      t.float :stock
      t.integer :category_id
      t.timestamps null: false
    end
  end
end
