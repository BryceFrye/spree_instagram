Spree::Core::Engine.routes.draw do
  get 'approve_photo/:photo' => 'instagram_photos#approve', as: 'approve_photo'
  get 'revoke_photo/:photo' => 'instagram_photos#revoke_approval', as: 'revoke_photo'
  get 'admin/instagram' => 'admin::instagram_photos#index', as: 'admin_instagram'
  get 'admin/instagram/check_for_new' => 'admin::instagram_photos#check_for_new', as: 'check_for_new'
end
