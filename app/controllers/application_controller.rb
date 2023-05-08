class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Doorkeeper code
  before_action :doorkeeper_authorize!, only: [:create, :update, :destroy]
  # skip_before_action :verify_authenticity_token
  respond_to :json

  protected

  # Devise methods
  # Authentication key(:username) and password field will be added automatically by devise.
  def configure_permitted_parameters
    added_attrs = [:email, :firstname, :lastname]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  # Doorkeeper methods
  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
