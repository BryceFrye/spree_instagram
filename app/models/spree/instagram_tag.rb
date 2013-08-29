module Spree
  class InstagramTag < ActiveRecord::Base
    attr_accessible :name, :active
    
    validates :name, uniqueness: true
    
    def self.active_tag
      Spree::InstagramTag.where(active: true).first.name
    end
    
  end
end