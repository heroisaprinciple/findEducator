class ApplicationController < ActionController::API
  def is_admin?
    if current_user.role != 'admin'
      render json: { message: 'You are not authorized to access this page.' }, status: :unauthorized
    end
  end
end
