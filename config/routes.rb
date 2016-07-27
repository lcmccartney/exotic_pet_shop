Rails.application.routes.draw do
  root to: redirect('/animals')

  resources :categories, only: [:index]

  resources :animals, only: [:show, :index]

  resources :cart_animals, only: [:create, :destroy, :update]

  get '/cart', to: 'cart_animals#index'

  get "/:category_slug", to: 'categories#show'
end
