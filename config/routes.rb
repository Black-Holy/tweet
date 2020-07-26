Rails.application.routes.draw do
  resources :calendars
  
  root 'pages#index'
  # get '/',  to: 'pages#index'  root 'pages#indexと同じ意味'
  get 'sessions/new'
  # get 'sessions/new',  to: 'sessions#new'　　　get 'sessions/new'と同じ意味
  
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