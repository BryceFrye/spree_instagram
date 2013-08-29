module Spree
  module Admin
    class InstagramPhotosController < Spree::Admin::ResourceController
      
      def index
        @photos = Spree::InstagramPhoto.where(tag_id: Spree::InstagramTag.active_tag_ids).order("created_time DESC")
      end
      
      def check_for_new
        Spree::InstagramPhoto.fetch_with_tag(Spree::InstagramTag.active_tags)
        redirect_to admin_instagram_photos_path
      end
      
    end
  end
end