class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, default: ""
      t.integer :price, null: false
      t.string :condition, null: false, default: ""
      t.string :category, null: false, default: ""
      t.string :brand, default: ""
      t.text :description, null: false
      t.string :shipping_fee, null: false, default: ""
      t.string :shipping_origin, null: false, default: ""
      t.string :shipping_duration, null: false, default: ""
      t.references :user, foreign_key: true
      t.timestamps null: false
      t.integer :status, null: false, default: 0
    end
  end
end
