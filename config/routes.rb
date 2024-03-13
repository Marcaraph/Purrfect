Rails.application.routes.draw do
  
  devise_for :users
  # resources :users do
  #   resources :carts, except: [:index]
  # end
  resources :carts, except: [:index]
  resources :items
  resources :cart_items, only: [:create, :destroy]
  resources :orders, only: [:new, :create]
  resources :users, only: [:show, :destroy]
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "items#index"
end
