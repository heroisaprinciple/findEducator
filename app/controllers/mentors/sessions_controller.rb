class Mentors::SessionsController < Devise::SessionsController
  include Accessible
  skip_before_action :check_user

  respond_to :json

  private

  def respond_with(_resource, _opts = {})
    render json: {
      message: 'You are logged in.',
      mentor: current_mentor
    }, status: :ok

  end

  def respond_to_on_destroy
    token = request.headers['Authorization']&.split(' ')&.last

    log_out_success && return if token

    log_out_failure
  end

  def log_out_success
    render json: { message: 'You are logged out.' }, status: :ok
  end

  def log_out_failure
    render json: { message: 'Hmm nothing happened.' }, status: :unauthorized
  end
end