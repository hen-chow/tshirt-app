Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # The root of site routed with store/index
  root "store#index"

  resources :orders
  resources :carts
  resources :line_items, only: [:new, :create, :update, :destroy]
  resources :users
  resources :sessions
  resources :designs, only: [:create]
  resources :charges

  resources :products, only: [:new]

  get "signup", to: "users#new", as: "signup"

  get "signin", to: "sessions#new", as: "signin"
  post "signin", to: "sessions#create"
  delete "signout", to: "sessions#destroy", as: "signout"

end
