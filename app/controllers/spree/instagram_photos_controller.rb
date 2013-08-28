module Spree
  class InstagramPhotosController < Spree::StoreController
    # TODO: before_filter :authenticate
    
    def approve
      @photo = Spree::InstagramPhoto.find(params[:photo])
      @photo.update_attributes(approved: true)
      redirect_to admin_instagram_path
    end
    
    def revoke_approval
      @photo = Spree::InstagramPhoto.find(params[:photo])
      @photo.update_attributes(approved: false)
      redirect_to admin_instagram_path
    end
    
  end
end