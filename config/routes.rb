# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  resources :links
  get '/:slug', to: 'links#redirect_to_url'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
