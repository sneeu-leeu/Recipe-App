# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "foods#index"

  resources :foods, only: [:index, :new, :create, :destroy]

  resources :public_recipes, :shopping_list

  resources :recipes do 
    resources :recipe_foods
  end 
end
