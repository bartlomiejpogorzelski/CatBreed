class Cats::KittensController < ApplicationController
  def index
    params[:q] ||= {}
    params[:q][:status_in] ||= ["available"]
    
    Rails.logger.info "Params before processing: #{params[:q]}"
    if params[:q].key?(:neutered_eq)
      params[:q][:neutered] = ActiveRecord::Type::Boolean.new.cast(params[:q][:neutered_eq])
    else
      params[:q][:neutered] = true
    end
    Rails.logger.info "Params after processing: #{params[:q]}"
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

