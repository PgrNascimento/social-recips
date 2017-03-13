Rails.application.routes.draw do
	root to: 'recipes#index'
  resources :cuisines, only:[:new, :create, :show]
  resources :food_types, only:[:new, :create, :show]
  resources :recipes, only:[:new, :create, :show, :index, :edit, :update]
  resources :users, only:[:new, :create, :show]

  post '/recipes/search', to: 'recipes#search'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
