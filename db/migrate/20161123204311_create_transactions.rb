class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :product_id
      t.float :quantity
      t.float :unit_charge
      t.text :description
      t.timestamps null: false
    end
  end
end
