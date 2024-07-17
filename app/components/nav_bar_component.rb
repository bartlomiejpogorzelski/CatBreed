# frozen_string_literal: true

class NavBarComponent < ViewComponent::Base
  def initialize(current_path:, logged_in:)
    @current_path = current_path
    @logged_in = logged_in
  end

  def active_class(path)
    "bg-gray-900 text-white" if (path.include?(@current_path) && ((@current_path != "/") || (path.include?("/home?"))) )
  end
end
