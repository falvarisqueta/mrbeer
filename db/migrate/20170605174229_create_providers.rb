class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :description
      t.string :contact
      t.string :phone_number
      t.timestamps null: false
    end
  end
end
