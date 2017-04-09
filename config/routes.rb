Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders
  resources :carts
  resources :line_items
  resources :users
  resources :sessions

  get "store/index"
  resources :products
  # The root of site routed with store/index
  root "store#index", as: "store"

  get "signup", to: "users#new", as: "signup"

  get "signin", to: "sessions#new", as: "signin"
 post "signin", to: "sessions#create"
 delete "signout", to: "sessions#destroy", as: "signout"

end
