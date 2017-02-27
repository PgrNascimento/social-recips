Rails.application.routes.draw do
  resources :cuisines, only:[:new, :create, :show]
end
