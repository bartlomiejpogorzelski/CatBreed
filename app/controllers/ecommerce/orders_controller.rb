class Ecommerce::OrdersController < ApplicationController

  def index
    @orders = current_user.orders.includes(:order_items, :products)
    render Ecommerce::Orders::OrdersComponent.new(orders: @orders)
  end

  def show
    @order = current_user.orders.find(params[:id])
    render Ecommerce::Orders::OrderDetailsComponent.new(order: @order)
  end
  
end
