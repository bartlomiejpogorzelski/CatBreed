class Ecommerce::ProductsController < ApplicationController

  def index
    @products = Product.all
    render Ecommerce::Products::ProductsComponent.new(products: @products)
  end
  
  def show
    @product = Product.find(params[:id])
    render Ecommerce::Products::ProductDetailsComponent.new(product: @product)
  end
end
