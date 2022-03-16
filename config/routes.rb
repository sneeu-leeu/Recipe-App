# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"

  resources :foods, :recipes, :public_recipes, :shopping_list
end
