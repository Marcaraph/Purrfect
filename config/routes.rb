Rails.application.routes.draw do
  namespace :admin do
      resources :carts
      resources :cart_items
      resources :items
      resources :orders
      resources :order_items
      resources :users

      root to: "carts#index"
    end
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :carts, except: [:index], param: :slug
  resources :items
  resources :cart_items, only: [:create, :destroy]
  resources :orders, only: [:new, :create]
  resources :users, only: [:show, :destroy]
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
end

# scope 'admin' do
#   get 'items/new', to: 'items#new'
# end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "items#index"
end
