class AddRemovedToInstagramPhotos < ActiveRecord::Migration
  def change
    add_column :spree_instagram_photos, :rejected, :boolean, default: false
  end
end
