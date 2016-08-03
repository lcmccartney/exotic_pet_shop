Rails.application.routes.draw do
  root 'welcome#index'

  resources :categories, only: [:index]
  resources :animals, only: [:show, :index, :new, :create, :update]
  resources :cart_animals, only: [:create, :destroy]
  resources :users, only: [:new, :create]
  resources :orders, only: [:index, :show, :create]

  get '/dashboard', to: 'users#show'
  
  put '/cart_animals/:id', to: 'cart_animals#increment'
  get '/cart', to: 'cart_animals#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/secret', to: 'secrets#index'

  namespace :admin do
    get '/dashboard', to: 'users#show'
    patch '/dashboard', to: 'users#update'
    resources :animals, only: [:index, :edit]
    resources :users, only: [:edit]
  end

  get "/:category_slug", to: 'categories#show'
end
