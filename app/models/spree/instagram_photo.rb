module Spree
  class InstagramPhoto < ActiveRecord::Base
    attr_accessible :photo_id, :url, :tag_id, :approved, :created_time
    
    belongs_to :spree_instagram_tag
    
    validates :photo_id, uniqueness: true
    
    def self.fetch_with_tag(tags)
      tags.each do |tag|
        result = HTTParty.get("https://api.instagram.com/v1/tags/#{tag.name}/media/recent?client_id=#{InstagramConfig::CLIENT_ID}")
        if result && result['data']
          result['data'].each do |photo|
            self.create(photo_id: photo['id'], 
                        url: photo['images']['low_resolution']['url'], 
                        tag_id: tag.id,
                        created_time: photo['created_time'])
          end
        end
      end
    end
    
    def self.approved_photos
      self.where(tag_id: Spree::InstagramTag.active_tag_ids).where(approved: true).order("created_time DESC")
    end
    
  end
end