Timeline::Application.routes.draw do
  get "button_game/button_index"
  get "button_game/button"  => 'button_game#button'
  get "user/signup"
  post "user/signup_complete"
  get "user/login"
  post "user/login_complete"
  get "user/logout"
  get "user/delete_user/:user_id" => 'user#delete_user'
  post "user/delete_user_complete"
  get "wall/write"
  get "wall/write/:user_id" => 'wall#write'
  post "wall/write_complete"
  get "wall/posts"
  get "wall/edit/:id" => 'wall#edit'
  post "wall/edit_complete"
  get "wall/delete/:id" => 'wall#delete'
  post "wall/delete_complete"
  get "wall/write_comment/:id&:user_id" => 'wall#write_comment'
  post "wall/write_comment_complete"
  get "wall/edit_comment/:id&:comment_id" => 'wall#edit_comment'
  post "wall/edit_comment_complete"
  get "wall/delete_comment/:comment_id" => 'wall#delete_comment'
  post "wall/delete_comment_complete"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
