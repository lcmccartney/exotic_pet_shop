Rails.application.routes.draw do
  get '/', to: 'welcome#index', as: :root

  get '/categories', to: 'categories#index'

  get '/animals', to: 'animals#index'
  get '/animals/new', to: 'animals#new', as: :new_animal
  post '/animals', to: 'animals#create'
  get '/animals/:id', to: 'animals#show', as: :animal
  patch '/animals/:id', to: 'animals#update'
  put '/animals/:id', to: 'animals#update'

  get '/users/new', to: 'users#new', as: :new_user
  post '/users', to: 'users#create'

  get '/dashboard', to: 'users#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/cart', to: 'cart_animals#index'
  post '/cart_animals', to: 'cart_animals#create'
  put '/cart_animals/:id', to: 'cart_animals#increment'
  delete '/cart_animals/:id', to: 'cart_animals#destroy', as: :cart_animal

  get '/orders', to: 'orders#index'
  post '/orders', to: 'orders#create'
  get '/orders/:id', to: 'orders#show', as: :order

  get '/admin/dashboard', to: 'admin/users#show'
  patch '/admin/dashboard', to: 'admin/users#update'
  get '/admin/animals', to: 'admin/animals#index'
  get '/admin/animals/:id/edit', to: 'admin/animals#edit', as: :edit_admin_animal
  get '/admin/users/:id/edit', to: 'admin/users#edit', as: :edit_admin_user

  get '/secret', to: 'secrets#index'

  get "/:category_slug", to: 'categories#show'
end
