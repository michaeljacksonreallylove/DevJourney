class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :remove_boolean_flash, if: -> { flash.any? }

  protected

    # devise
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [ :devjourney_id ])
      devise_parameter_sanitizer.permit(:account_update, keys: [ :devjourney_id, :name, :introduction, :github_url, :avatar ])
    end

    def after_sign_up_path_for(resource)
      root_path
    end

    def after_sign_out_path_for(resource_or_scope)
      new_user_session_path
    end

  private
    # フラッシュに入るbooleanの表示を削除
    def remove_boolean_flash
      flash.each do |key, value|
        flash.delete(key) if value == true || value == false
      end
    end
end
