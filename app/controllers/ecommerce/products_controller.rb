class Ecommerce::ProductsController < ApplicationController

  def index
    @products = Product.all
    render Ecommerce::Products::ProductsComponent.new(products: @products)
  end
  
end
