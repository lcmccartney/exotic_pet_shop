Rails.application.routes.draw do
  resources :categories, only: [:index, :show]

  resources :animals, only: [:show, :index]

  resources :cart_animals, only: [:create]
end
