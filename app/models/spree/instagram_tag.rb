module Spree
  class InstagramTag < ActiveRecord::Base
    attr_accessible :name, :active, :deleted
    
    has_many :spree_instagram_photos
    
    validates :name, uniqueness: true
    
    def self.active_tags
      Spree::InstagramTag.where(active: true)
    end
    
    def self.active_tag_names
      tags = self.active_tags
      names = []
      tags.each do |tag|
        names << tag.name
      end
      return names
    end
    
    def self.active_tag_ids
      tags = self.active_tags
      tag_ids = []
      tags.each do |tag|
        tag_ids << tag.id
      end
      return tag_ids
    end
    
  end
end