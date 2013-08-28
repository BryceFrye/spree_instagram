module Spree
  module Admin
    class InstagramPhotosController < Spree::Admin::ResourceController
      
      def index
        Spree::InstagramPhoto.fetch_with_tag(InstagramConfig::TAG)
        @photos = Spree::InstagramPhoto.where(tag: InstagramConfig::TAG).order("id ASC")
      end
      
    end
  end
end