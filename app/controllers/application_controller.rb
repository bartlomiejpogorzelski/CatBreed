class ApplicationController < ActionController::Base
  before_action :set_locale

  append_view_path Rails.root.join("app", "components")

  private 
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
