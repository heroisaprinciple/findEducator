Rails.application.routes.draw do
  resources :subjects
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "users#index"
end
