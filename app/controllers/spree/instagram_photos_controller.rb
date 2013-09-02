module Spree
  class InstagramPhotosController < Spree::StoreController
    before_filter :find_photo
    
    def approve
      if @photo.update_attributes(approved: true)
        render json: { status: :success }
      else
        render json: { status: :failure }
      end
    end
    
    def revoke_approval
      if @photo.update_attributes(approved: false)
        render json: { status: :success }
      else
        render json: { status: :failure }
      end
    end
    
    def reject
      if @photo.update_attributes(rejected: true)
        render json: { status: :success }
      else
        render json: { status: :failure }
      end
    end
    
    def undo_reject
      if @photo.update_attributes(rejected: false)
        render json: { status: :success }
      else
        render json: { status: :failure }
      end
    end
    
    private
      
      def find_photo
        @photo = Spree::InstagramPhoto.find(params[:photo])
      end
    
  end
end