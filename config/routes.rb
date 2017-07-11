Rails.application.routes.draw do
 devise_for :users, :controllers => { :registrations => 'registrations' }
 root :to => 'products#index'

 resources :order_items
 resource :cart, only: [:show]
 resources :products
 resources :users
 resources :orders do
   resources :order_items
 end
end
