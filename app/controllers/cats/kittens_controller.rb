class Cats::KittensController < ApplicationController

  def index
    @q = Cat.not_parent.ransack(params[:q])
    @cats = @q.result
    render Kittens::KittensComponent.new(cats: @cats, q: @q)
  end

  def show
    render Kittens::KittenDetailsComponent.new(cat: cat)
  end

  private

  def cat
    @cat ||= Cat.find(params[:id])
   end

end
