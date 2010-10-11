Yule::Application.routes.draw do
  resources :option_groups
  resources :products
  resources :shops do
    resources :products
  end
  resources :users
  root :to => 'shops#index'
end
