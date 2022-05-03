class ApplicationController < ActionController::Base
  before_action :require_user_logged_in
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    current_user
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def require_user_logged_in
    redirect_to new_user_session_url unless user_signed_in?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
