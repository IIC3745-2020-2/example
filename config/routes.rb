# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: "repositories#index"

  resources :users
  resources :repositories, only: %i[index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
