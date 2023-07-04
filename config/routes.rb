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

  namespace :api do
    namespace :v1 do
      resources :categories do
        resources :subjects
      end

      resources :mentors do
        resources :ratings, only: %i[index create]
        resources :availabilities
      end

      resources :appointments

      resources :conversations do
        resources :personal_messages
      end

      get '/member-data', to: 'members#show'

      post "create-checkouts-session", to: 'appointments#create_checkout_session', as: :create_checkout_session
    end
  end

end