class PagesController < ApplicationController

  def show
    render Statics::AboutRaceComponent.new if params[:page].eql? "AboutRace"
  end
end
