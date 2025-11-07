class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:devjourney_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:devjourney_id])
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
