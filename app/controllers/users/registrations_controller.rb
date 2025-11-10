class Users::RegistrationsController < Devise::RegistrationsController
  protected

    # パスワード入力なしでアカウント更新を可能にする
    def update_resource(resource, params)
      if params[:password].blank? && params[:password_confirmation].blank? && params[:current_password].blank?
        params.delete(:current_password)
        resource.update_without_password(params)
      else
        super
      end
    end
    
    def after_update_path_for(resource)
      resource.profile_page_uri
    end
end