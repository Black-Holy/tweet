Rails.application.routes.draw do
  resources :calendars
  
  root 'pages#index'
  get 'sessions/new'
  
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :topics
  resources :comments
  
  namespace :admin do
    resources :users, only: [:index,:destroy]
  end
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end