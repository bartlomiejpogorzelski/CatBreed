# frozen_string_literal: true

class Ecommerce::Orders::OrderDetailsComponent < ViewComponent::Base

  def initialize(order:)
    @order = order
  end
  
end
