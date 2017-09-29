class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :force_set_company

  def home
    unless current_user.nil?
      redirect_to adminlte_path
    end
  end

  protected
  def force_set_company
    unless current_user.nil? || request.path.include?('session')
      byebug
      unless request.path.include?('companies')
        if (session[:user_type] == "company") || (current_user.user_type == 'company' && current_user.company.nil?)
          if current_user.user_type.nil? && session[:user_type].nil? == false
            current_user.user_type = session[:user_type]
          end
          if current_user.save
            session[:user_type] = nil
            unless current_user.nil? || current_user.user_type != 'company'
              if current_user.company.nil?
                return redirect_to new_company_path
              end
            end
          end
        end
      end
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :display_name, :profile_image,  :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :profile_image,  :password,  :current_password])
  end
end
