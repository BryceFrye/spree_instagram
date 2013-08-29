Spree::Core::Engine.routes.draw do
  get 'approve_photo/:photo' => 'instagram_photos#approve', as: 'approve_photo'
  get 'revoke_photo/:photo' => 'instagram_photos#revoke_approval', as: 'revoke_photo'
  get 'admin/instagram' => 'admin::instagram_photos#index', as: 'admin_instagram_photos'
  get 'admin/instagram/check_for_new' => 'admin::instagram_photos#check_for_new', as: 'admin_check_for_new'
  get 'admin/instagram_tags' => 'admin::instagram_tags#index', as: 'admin_instagram_tags'
  post 'admin/create_instagram_tag' => 'admin::instagram_tags#create_tag', as: 'admin_create_instagram_tag'
  put 'admin/activate_instagram_tag/:tag' => 'admin::instagram_tags#activate_tag', as: 'activate_instagram_tag'
  put 'admin/unactivate_instagram_tag/:tag' => 'admin::instagram_tags#unactivate_tag', as: 'unactivate_instagram_tag'
  delete 'admin/delete_instagram_tag/:tag' => 'admin::instagram_tags#delete_tag', as: 'delete_instagram_tag'
end
