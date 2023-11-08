class Admin::CatsController < ApplicationController
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

  def new
    @cat = Cat.new
    render Admin::Cats::NewCatComponent.new(cat: @cat)
  end

  def index    
    render Admin::Cats::IndexComponent.new
  end
  
  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to admin_cats_path
    else
      render :new
    end
  end

  private

  def authorize_admin
    authorize! :manage, :all # Sprawdź, czy użytkownik ma uprawnienia administratorskie
  end

  def cat_params
    params.require(:cat).permit(:name, :breed, :color, :date_of_birth, :gender, :description, :images, :pedigree_information, :price, :status, :vaccination_information, :health_status, :owner_information, :location, :neutered, :notes, :videos)
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name address phone ])
  #   devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name address phone ])
  # end

end
