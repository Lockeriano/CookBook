# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/new'
  resources :users

  resources :recipes do
    resources :recipe_ingredients
  end
  resources :ingredients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recipes#index'
end
