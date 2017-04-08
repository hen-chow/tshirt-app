Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders
  resources :carts
  resources :line_items

  get "store/index"
  resources :products
  # The root of site routed with store/index
  root "store#index", as: "store"
end
