Rails.application.routes.draw do
  resources :cuisines, only:[:new, :create, :show]
  resources :food_types, only:[:new, :create, :show]
end
