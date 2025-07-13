# frozen_string_literal: true

class Ecommerce::Products::ProductsComponent < ViewComponent::Base

  def initialize(products:)
    @products = Product.all
  end
end
