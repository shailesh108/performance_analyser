Rails.application.routes.draw do
      root 'home#index'
      # get 'home/detail'
     devise_for :admins, :skip => [:sessions] 
     devise_scope :admin do
      post 'admin/login/:resource' => 'admins/sessions#create',as: :session
      delete 'admin/logout' => 'admins/sessions#destroy', as: :destroy_admin_session
      get 'admin/login' => 'admins/sessions#new', as: :new_admin_session
     end

     devise_for :teachers, :skip => [:sessions] 
     devise_scope :teacher do
      post 'login/:resource' => 'teachers/sessions#create',as: :teacher_session
      delete 'teacher/logout' => 'teachers/sessions#destroy', as: :destroy_teacher_session
      get 'teacher/login' => 'teachers/sessions#new', as: :new_teacher_session
     end

    
   
  # # The priority is based upon order of creation: first created -> highest priority.
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
