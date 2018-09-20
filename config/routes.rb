# frozen_string_literal: true

Rails.application.routes.draw do
  root 'recipes#index'
  get '/signup',  to: 'users#new'
  get '/login',   to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users

  resources :recipes do
    resources :recipe_ingredients
  end
  resources :ingredients
end
