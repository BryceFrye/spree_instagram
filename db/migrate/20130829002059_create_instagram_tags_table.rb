class CreateInstagramTagsTable < ActiveRecord::Migration
  def change
    create_table :spree_instagram_tags do |t|
      t.string :name, unique: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
