class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :condition, null: false
      t.string :brand
      t.text :description, null: false
      t.string :shipping_fee, null: false
      t.string :shipping_origin, null: false
      t.string :shipping_duration, null: false
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
