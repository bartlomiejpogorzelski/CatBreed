# frozen_string_literal: true

class Ecommerce::Products::ProductsComponent < ViewComponent::Base

  def initialize()
    @products = Product.all
  end
end
