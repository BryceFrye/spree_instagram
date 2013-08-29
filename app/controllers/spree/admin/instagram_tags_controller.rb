module Spree
  module Admin
    class InstagramTagsController < Spree::Admin::ResourceController

      def index
        @instagram_tags = Spree::InstagramTag.where(deleted: false)
      end
      
      def create_tag
        @tag = Spree::InstagramTag.where(name: params[:instagram_tag])
        if @tag = Spree::InstagramTag.find_by_name(params[:instagram_tag][:name])
          @tag.update_attributes(deleted: false)
          redirect_to admin_instagram_tags_path
        else
          @instagram_tag = Spree::InstagramTag.new(params[:instagram_tag])
          @instagram_tag.save
          redirect_to admin_instagram_tags_path
        end
      end
      
      def activate_tag
        @tag = Spree::InstagramTag.find(params[:tag])
        @tag.update_attributes(active: true)
        redirect_to admin_instagram_tags_path
      end
      
      def unactivate_tag
        @tag = Spree::InstagramTag.find(params[:tag])
        @tag.update_attributes(active: false)
        redirect_to admin_instagram_tags_path
      end
      
      def delete_tag
        @tag = Spree::InstagramTag.find(params[:tag])
        @tag.update_attributes(active: false, deleted: true)
        redirect_to admin_instagram_tags_path
      end
      
    end
  end
end