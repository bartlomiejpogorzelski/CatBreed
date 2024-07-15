class Admin::CatsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  # before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    exception.default_message = "You are not authorized to perform this task"
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to unauthorized_path, alert: exception.message }
    end
  end

  def new
    @cat = Cat.new
    @cat.photos.build
    render Admin::Cats::NewCatComponent.new(cat: @cat)
  end

  def index
    @cats = Cat.all
    render Admin::Cats::IndexComponent.new(cats: @cats)
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(status: params["status"])
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "cat_#{@cat.id}",
            Admin::Cats::CatRowComponent.new(cat: @cat)
          )
        end
      end
    end
   end
  
  def create  
    @cat = Cat.new(cat_params)

    if params[:cat][:photos_attributes].present?
      params[:cat][:photos_attributes].each do |key, photo_attributes|
        photo_attributes.each do |file_key, file|
          uploaded_file = Shrine.upload(photo_attributes[file_key.to_s], :store)
          if uploaded_file.present?
            photo = Photo.new(image: uploaded_file)
            @cat.photos << photo
          end
        end
      end
    end

    if @cat.save
      redirect_to admin_cats_path
    else
      # render :new
      # TODO Wait for validation
    end
  end


  private

  def authorize_admin
    authorize! :manage, :all
  end

  def cat_params
    params.require(:cat).permit(
      :name, :breed, :color, :date_of_birth, :gender, :description,
      :pedigree_information, :price, :status, :vaccination_information,
      :health_status, :owner_information, :location, :neutered, :notes, :videos,
      photos_attributes: [:id, :_destroy, :image_1, :image_2, :image_3]
    )
  end  

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name address phone ])
  #   devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name address phone ])
  # end

end
