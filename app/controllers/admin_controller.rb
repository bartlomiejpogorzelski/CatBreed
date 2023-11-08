class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  # before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    exception.default_message = "You are not authorized to perform this task"
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_path, alert: exception.message }
    end
  end

  def index
    render Admin::NewComponent.new
  end

  
  private

  def authorize_admin
    authorize! :manage, :all # Sprawdź, czy użytkownik ma uprawnienia administratorskie
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name address phone ])
  #   devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name address phone ])
  # end

end
