class Kittens::KittensController < ApplicationController

  def index
    cats = Cat.all
    render Kittens::KittensComponent.new(cats: cats)
  end

end
