Rails.application.routes.draw do
  root to: redirect('/animals')

  resources :categories, only: [:index]

  resources :animals, only: [:show, :index]

  resources :cart_animals, only: [:create, :destroy, :update]

  resources :users, only: [:new, :create]

  get '/cart', to: 'cart_animals#index'

  get '/login', to: 'sessions#new'
  
  get '/dashboard', to: 'users#show'

  #keep this at the bottom
  get "/:category_slug", to: 'categories#show'
end
