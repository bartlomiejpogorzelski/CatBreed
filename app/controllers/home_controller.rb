class HomeController < ApplicationController

  
  def index
    render HomeComponent.new
  end
end
