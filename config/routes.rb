Rails.application.routes.draw do
  resources :albums
  resources :cart_items, only: [:create, :destroy]
  root to: 'albums#index'
  get 'albums/index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
