Rails.application.routes.draw do
  resources :tops, only: [:index, :new, :create, :destroy]
  devise_for :users
  
  root to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
end
