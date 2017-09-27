class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :force_set_company
  def home
    unless current_user.nil?
      unless session[:user_type].nil?
        current_user.user_type = session[:user_type]
        if current_user.save
          session[:user_type] = nil
          force_set_company
        end
      end
      redirect_to adminlte_path
    end
  end

  protected
  def force_set_company
    unless request.path.include?('companies')
      unless current_user.nil? || current_user.user_type != 'company'
        if current_user.company.nil?
          redirect_to new_company_path
        end
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :display_name, :profile_image,  :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :profile_image,  :password,  :current_password])
  end
end
