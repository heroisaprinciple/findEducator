class Mentors::RegistrationsController < Devise::RegistrationsController
  include Accessible
  skip_before_action :check_user

  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: {
      message: 'Signed up sucessfully.',
      user: current_user
    }, status: :ok
  end

  def register_failed
    render json: { message: 'Something went wrong.' }, status: :unprocessable_entity
  end

  private

  def sign_up_params
    params.require(:mentor).permit(:first_name, :last_name, :email, :password, :password_confirmation,
                                   :occupation, :subject_id)
  end
end