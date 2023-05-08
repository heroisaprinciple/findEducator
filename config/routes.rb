Rails.application.routes.draw do
  # namespace api: do
  #   namespace :v1 do
  #     use_doorkeeper do
  #       skip_controllers :authorization, :application, :authorized_applications
  #     end
  #   end
  # end

  use_doorkeeper do
    # No need to register client application
    skip_controllers :applications, :authorized_applications
  end
  devise_for :users

  namespace :api do
    namespace :v1 do
      scope :users, module: :users do
        post '/', to: 'registrations#create', as: :user_registration
      end
      resources :subjects
    end
  end

  # draw :api

  # root "users#index"
end
