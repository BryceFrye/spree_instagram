module Spree
  class InstagramPhoto < ActiveRecord::Base
    attr_accessible :photo_id, :url, :tag_id, :approved, :rejected, :created_time
    
    belongs_to :instagram_tag, foreign_key: :tag_id
    
    validates :photo_id, uniqueness: true
    
    default_scope order('created_time DESC')
    scope :active, -> { where tag_id: Spree::InstagramTag.active_tag_ids }
    scope :approved, -> { where approved: true }
    scope :rejected, -> { where rejected: true }
    scope :not_rejected, -> { where rejected: false }
    
    def self.fetch_with_tag(tags)
      tags.each do |tag|
        result = HTTParty.get("https://api.instagram.com/v1/tags/#{tag.name}/media/recent?client_id=#{InstagramConfig::CLIENT_ID}")
        if result && result['data']
          result['data'].each do |photo|
            self.create(photo_id: photo['id'], 
                        url: photo['images']['low_resolution']['url'].sub(/http/, 'https'), 
                        tag_id: tag.id,
                        created_time: photo['created_time'])
          end
        end
      end
    end
    
    def self.approved_photos
      self.active.approved
    end
    
  end
end