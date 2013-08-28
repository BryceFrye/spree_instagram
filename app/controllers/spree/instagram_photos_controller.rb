module Spree
  class InstagramPhotosController < Spree::StoreController
    
    def approve
      @photo = Spree::InstagramPhoto.find(params[:photo])
      if @photo.update_attributes(approved: true)
        render json: { status: :success }
      else
        render json: { status: :failure }
      end
    end
    
    def revoke_approval
      @photo = Spree::InstagramPhoto.find(params[:photo])
      if @photo.update_attributes(approved: false)
        render json: { status: :success }
      else
        render json: { status: :failure }
      end
    end
    
  end
end