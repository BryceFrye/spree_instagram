module Spree
  module Admin
    class InstagramTagsController < Spree::Admin::ResourceController

      def index
        @instagram_tags = Spree::InstagramTag.all
      end
      
      def create_tag
        @instagram_tag = Spree::InstagramTag.new(params[:instagram_tag])
        if @instagram_tag.save
          @instagram_tag.update_attributes(active: false)
          redirect_to admin_instagram_tags_path
        end
      end
      
      def activate_tag
        @active_tag = Spree::InstagramTag.where(active: true).first
        if @active_tag.update_attributes(active: false)
          @tag = Spree::InstagramTag.find(params[:tag])
          if @tag.update_attributes(active: true)
            redirect_to admin_instagram_tags_path
          end
        else
          redirect_to admin_instagram_tags_path
        end
      end
      
      def unactivate_tag
        @tag = Spree::InstagramTag.find(params[:tag])
        if @tag.update_attributes(active: false)
          redirect_to admin_instagram_tags_path
        end
      end
      
      def delete_tag
        @tag = Spree::InstagramTag.find(params[:tag])
        if @tag.destroy
          redirect_to admin_instagram_tags_path
        end
      end
      
    end
  end
end