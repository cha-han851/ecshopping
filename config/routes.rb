Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'products#index'
  get 'products/search'
  resources :products, only: [:index, :create, :show, :new] do
    resources :orders, only:[:index, :create]
  end
  resources :galleries, only: [:new,:index,:create,:show]
  resources :users, only: [:edit, :update, :create, :show]
  resources :articles, only: [:show]
  resource :carts, only: [:show]
    post '/add_product',to: 'carts#add_product'
    post '/update_product', to:'carts#update_product'
    delete '/delete_product', to:'carts#delete_product'
   
end