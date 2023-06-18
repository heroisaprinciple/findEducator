Rails.application.routes.draw do
  devise_for :mentors
  devise_for :users, path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup',
             },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'

  namespace :api do
    namespace :v1 do
      resources :categories do
        resources :subjects
      end
      resources :users do
        resources :appointements
        resources :personal_messages, only: [:index, :create]
      end
      # resources :appointements
      resources :ratings
      post "create-checkouts-session", to: 'appointements#create_checkout_session', as: :create_checkout_session
    end
  end
end