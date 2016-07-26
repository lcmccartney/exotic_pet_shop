Rails.application.routes.draw do
  resources :categories, only: [:index, :show]

  resources :animals, only: [:show, :index]

  resources :cart_animals, only: [:create]

  get '/cart', to: 'cart_animals#index'
end
