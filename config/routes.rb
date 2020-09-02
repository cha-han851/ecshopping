Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'products#index'
  get 'products/search'
  resources :products, only: [:index, :create, :show, :new] 
  resources :users, only: [:edit, :update, :create, :show]
  resources :articles, only: [:show]
  resource :carts, only: [:show]
    post '/add_item',to: 'carts#add_item'
    post '/update_item', to:'carts#update_item'
    delete '/delete_item', to:'carts#delete_item'
end
