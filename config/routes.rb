Rails.application.routes.draw do
  resources :cuisines, only:[:new, :create, :show]
  resources :food_types, only:[:new, :create, :show]
  resources :recipes, only:[:new, :create, :show, :index]
  resources :users, only:[:new, :create, :show]
  
  post '/recipes/search', to: 'recipes#search'
  
end
