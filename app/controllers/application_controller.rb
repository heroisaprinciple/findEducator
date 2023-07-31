class ApplicationController < ActionController::API
  include Pundit::Authorization
  def admin_access
    # current_user.admin? comes from enums
    return if current_user.admin?

    unauthorized_message
  end

  def mentor_or_admin_access
    return if current_mentor.present? || current_user.admin?

    unauthorized_message
  end

  def mentor_or_user_access
    return if current_mentor || current_user

    unauthorized_message
  end

  def unauthorized_message
    render json: { message: 'You are not authorized to access this page.' }, status: :unauthorized
  end

  def forbidden_message
    render json: { message: 'Sorry, but you are not allowed to do this action.' }, status: :forbidden
  end

end
