module Spree
  module Admin
    class InstagramPhotosController < Spree::Admin::ResourceController
      
      def index
        Spree::InstagramPhoto.fetch_with_tag("prizecandle")
        @photos = Spree::InstagramPhoto.where(tag: "prizecandle").order("id ASC")
      end
      
    end
  end
end