Rails.application.routes.draw do
  root to: redirect('/animals')

  resources :categories, only: [:index]

  resources :animals, only: [:show, :index]

  resources :cart_animals, only: [:create, :destroy, :update]

  resources :users, only: [:new, :create]

  get '/cart', to: 'cart_animals#index'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show'

  #keep this at the bottom - error message @category
  get "/:category_slug", to: 'categories#show'
end
