# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"

  resources :foods, :public_recipes, :shopping_list

  resources :recipes do 
    resources :recipe_foods
  end 
end
