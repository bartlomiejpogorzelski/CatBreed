class UnauthorizedController < ApplicationController

  def show
    render Shared::UnauthorizedComponent.new 
  end
end
