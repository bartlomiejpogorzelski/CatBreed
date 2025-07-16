# frozen_string_literal: true

class Ecommerce::Products::ProductDetailsComponent < ViewComponent::Base

  def initialize(product:)
    @product = product
  end
  
end
