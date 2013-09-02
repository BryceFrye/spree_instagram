module Spree
  module Admin
    class InstagramPhotosController < Spree::Admin::ResourceController
      
      def index
        @photos = Spree::InstagramPhoto.active.not_rejected
      end
      
      def rejected
        @photos = Spree::InstagramPhoto.active.rejected
      end
      
      def check_for_new
        Spree::InstagramPhoto.fetch_with_tag(Spree::InstagramTag.active_tags)
        redirect_to admin_instagram_photos_path
      end
      
    end
  end
end