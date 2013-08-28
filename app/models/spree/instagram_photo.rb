module Spree
  class InstagramPhoto < ActiveRecord::Base
    attr_accessible :photo_id, :url, :tag, :approved
    
    validates :photo_id, uniqueness: true 
    
    def self.fetch_with_tag(tag)
      result = HTTParty.get("https://api.instagram.com/v1/tags/fsfdxgrstyfdhgdfty/media/recent?client_id=#{InstagramConfig::CLIENT_ID}")
      logger.debug "INSTAGRAM RESULT #{result.inspect}"
      if result && result['data']
        result['data'].each do |photo|
          self.create(photo_id: photo['id'], url: photo['images']['low_resolution']['url'], tag: tag)
        end
      end
    end
    
  end
end