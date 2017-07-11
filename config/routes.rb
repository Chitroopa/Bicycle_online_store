Rails.application.routes.draw do
  get 'reviews/index'

 devise_for :users, :controllers => { :registrations => 'registrations' }
 root :to => 'products#index'

 resources :order_items
 resource :cart, only: [:show]
 resources :products do
   resources :reviews
 end
 resources :users
 resources :orders do
   resources :order_items
 end
end
