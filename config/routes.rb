# frozen_string_literal: true
Rails.application.routes.draw do

  devise_for :users, path: 'users', controllers: {
                         sessions: 'users/sessions',
                         registrations: 'users/registrations'
                       }

  devise_for :mentors, path: 'mentors', controllers: {
                           sessions: 'mentors/sessions',
                           registrations: 'mentors/registrations'
                         }

  resources :appointments, only: [:index, :show, :create]

  get '/member-data', to: 'members#show'

  resources :categories do
    resources :subjects
  end

  resources :mentors, only: [:index, :show, :destroy] do
    resources :ratings, only: [:index, :create]
    resources :availabilities, only: [:index, :create, :update, :destroy]
  end

  resources :conversations, only: [:index, :create, :destroy] do
    resources :personal_messages, only: [:index, :create, :destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :appointments, only: [:index, :show, :create]
    end
  end
end