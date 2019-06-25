Rails.application.routes.draw do
  root 'tops#index'
  resources :users
  resources :account_activations,only: [:edit]
  get '/login',to: 'sessions#new'
  post '/login',to: 'sessions#create'
  delete '/login',to: 'sessions#destroy'
end
