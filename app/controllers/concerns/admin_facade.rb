module AdminFacade
  def is_admin?
    unless current_user&.admin?
      redirect_to api_v1_subjects_path,
                  alert: 'You are not authorized to access this page.'
    end
  end
end