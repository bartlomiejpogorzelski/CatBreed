class Kittens::KittensController < ApplicationController

  def index
    cats = Cat.all
    render Kittens::KittensComponent.new(cats: cats)
  end

  def show
    render Kittens::KittenDetailsComponent.new(cat: cat)
  end

  private

  def cat
    @cat ||= Cat.find(params[:id])
   end

end
