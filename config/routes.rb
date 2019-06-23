Rails.application.routes.draw do
  root 'tops#index'
  resources :users

  get '/login',to: 'sessions#new'
  post '/login',to: 'sessions#create'
  delete '/login',to: 'sessions#destroy'
end
