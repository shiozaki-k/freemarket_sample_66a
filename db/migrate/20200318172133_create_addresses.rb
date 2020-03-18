class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postal_code,        default: 0, null: false
      t.string :prefectures,         null: false, default: ""
      t.string :city_name,           null: false, default: ""
      t.string :street_number,       null: false, default: ""
      t.string :building_name,       null: false, default: ""
      t.references :user,            foreign_key: true
      t.timestamps
    end
  end
end
