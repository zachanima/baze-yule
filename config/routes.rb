Yule::Application.routes.draw do
  resources :option_groups
  resources :orders
  resources :products
  resources :shops do
    resources :products do
      resources :orders
    end
    member do
      devise_for :users
    end
    resources :users
  end
  resources :users do
    collection do
      post :upload
      post :import
    end
  end
  match '/:id', :to => 'shops#show'
  root :to => 'shops#index'
end
