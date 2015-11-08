Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :index]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :gifs, only: [:index, :show]
  resources :favorites, only: [:new, :create, :destroy]

  namespace :admin do
    resources :gifs, only: [:new, :create]
    resources :categories, only: [:new, :create, :index, :destroy]
  end

end
