Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'tops#index'
  resources :users
  resources :services do
    collection do
      get :demand
      get :supply
      post :demand_create
      post :supply_create
    end
  end
  resources :comments,only: [:create]
  resources :account_activations,only: [:edit]
  resources :password_resets,only: [:new,:create,:edit,:update]
  get '/login',to: 'sessions#new'
  post '/login',to: 'sessions#create'
  delete '/logout',to: 'sessions#destroy'
end
