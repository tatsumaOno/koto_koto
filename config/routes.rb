Rails.application.routes.draw do
  get 'services/new'
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'tops#index'
  resources :users
  resources :account_activations,only: [:edit]
  resources :password_resets,only: [:new,:create,:edit,:update]
  get '/login',to: 'sessions#new'
  post '/login',to: 'sessions#create'
  delete '/logout',to: 'sessions#destroy'
end
