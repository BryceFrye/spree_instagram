module Spree
  module Admin
    class InstagramPhotosController < Spree::Admin::ResourceController
      
      def index
        @photos = Spree::InstagramPhoto.where(tag: InstagramConfig::TAG).order("id ASC")
      end
      
      def check_for_new
        Spree::InstagramPhoto.fetch_with_tag(InstagramConfig::TAG)
        redirect_to admin_instagram_path
      end
      
    end
  end
end