Rails.application.routes.draw do
  # use_doorkeeper
  # devise_for :users
  # resources :subjects
  #
  # draw :api

    # Use for login and autorize all resource
    use_doorkeeper do
      # No need to register client application
      skip_controllers :applications, :authorizations, :authorized_applications
    end

    scope module: :api, defaults: { format: :json } do
      scope module: :v1  do
        devise_for :users, controllers: {
          registrations: 'api/v1/users/registrations',
        }, skip: [:sessions, :password]
      end
    end
end