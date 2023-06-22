class ApplicationController < ActionController::API
  def access
    # current_user.admin? comes from enums
    return if current_mentor.present? || current_user.admin?

    render json: { message: 'You are not authorized to access this page.' }, status: :unauthorized
  end
end
