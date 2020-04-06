class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, default: ""
      t.integer :price, null: false
      t.string :condition, null: false, default: ""
      t.string :brand, default: ""
      t.text :description, null: false
      t.string :shipping_fee, null: false, default: ""
      t.string :shipping_origin, null: false, default: ""
      t.string :shipping_duration, null: false, default: ""
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
