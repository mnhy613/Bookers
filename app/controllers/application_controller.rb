class ApplicationController < ActionController::Base


   before_action :configure_permitted_parameters, if: :devise_controller?
   before_action :login_required

  def after_sign_in_path_for(resource)
    user_path(current_user) # ログイン後に遷移するpathを設定
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end


  private

  def login_required

  end


end
