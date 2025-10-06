# frozen_string_literal: true

class Ecommerce::CartComponent < ViewComponent::Base
  
  def initialize(items:, total_price:)
    @items = items
    @total_price = total_price
  end
end
