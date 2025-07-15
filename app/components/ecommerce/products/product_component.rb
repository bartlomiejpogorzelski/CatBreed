# frozen_string_literal: true

class Ecommerce::Products::ProductComponent < ViewComponent::Base

  def initialize(product:)
    @product = product
  end
  
end
