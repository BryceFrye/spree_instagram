class CreateInstagramPhotosTable < ActiveRecord::Migration
  def change
    create_table :spree_instagram_photos do |t|
      t.string :photo_id, unique: true
      t.string :url
      t.string :tag
      t.boolean :approved, default: false

      t.timestamps
    end
    add_index :spree_instagram_photos, :photo_id
  end
end
