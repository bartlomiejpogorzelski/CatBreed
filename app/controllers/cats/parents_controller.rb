class Cats::ParentsController < ApplicationController

  def index
    cats = Cat.where(is_parent: true)
    render Cats::ParentsComponent.new(cats: cats)
  end

  def show
    render Cats::ParentDetailsComponent.new(cat: cat)
  end

  private

  def cat
    @cat ||= Cat.find(params[:id])
   end
   
end
