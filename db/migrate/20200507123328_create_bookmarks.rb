class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps null:false
    end
    add_index :bookmarks, :user_id
    add_index :bookmarks, :category_id
  end
end
