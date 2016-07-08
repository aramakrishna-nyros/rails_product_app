class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_id
      t.string :title
      t.integer :price
      t.string :quantity
      t.string :vat
      t.integer :totol_price
      t.text :description

      t.timestamps null: false
    end
  end
end
