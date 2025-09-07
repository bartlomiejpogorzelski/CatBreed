# frozen_string_literal: true

class Ecommerce::Orders::OrdersComponent < ViewComponent::Base

  def initialize(orders:)
    @orders = orders
  end
end
