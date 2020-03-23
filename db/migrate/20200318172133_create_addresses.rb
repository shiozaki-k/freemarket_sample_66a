class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :last_name_ad,        null: false, default: ""
      t.string :first_name_ad,       null: false, default: ""
      t.string :last_furigana_ad,    null: false, default: ""
      t.string :first_furigana_ad,   null: false, default: ""
      t.integer :postal_code,        null: false
      t.string :prefectures,         null: false, default: ""
      t.string :city_name,           null: false, default: ""
      t.string :street_number,       null: false, default: ""
      t.string :building_name,       default: ""
      t.references :user,            foreign_key: true
      t.timestamps null: false
    end
  end
end
