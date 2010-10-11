Yule::Application.routes.draw do
  resources :option_groups
  resources :products
  resources :shops do
    resources :products
    member do
      devise_for :users
    end
  end
  resources :users do
    collection do
      post :upload
      post :import
    end
  end
  root :to => 'shops#index'
end
