class ChangeInstagramPhotoTable < ActiveRecord::Migration
  def change
    remove_column :spree_instagram_photos, :tag
    add_column :spree_instagram_photos, :tag_id, :integer
    add_column :spree_instagram_photos, :created_time, :integer
  end
end
