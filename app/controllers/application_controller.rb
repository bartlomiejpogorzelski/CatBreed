class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :set_default_url_options

  append_view_path Rails.root.join("app", "components")

  private 
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  def set_default_url_options
    Rails.application.routes.default_url_options[:host] = request.base_url
  end
end
