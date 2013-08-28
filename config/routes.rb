Spree::Core::Engine.routes.draw do
  get 'approve_photo/:photo' => 'instagram_photos#approve', as: 'approve_photo'
  get 'revoke_photo/:photo' => 'instagram_photos#revoke_approval', as: 'revoke_photo' 
end
