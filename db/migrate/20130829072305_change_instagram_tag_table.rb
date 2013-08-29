class ChangeInstagramTagTable < ActiveRecord::Migration
  def change
    add_column :spree_instagram_tags, :deleted, :boolean, default: false
  end
end
