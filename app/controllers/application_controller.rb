class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    unless current_user.nil?
      redirect_to adminlte_path
    end
  end
end
