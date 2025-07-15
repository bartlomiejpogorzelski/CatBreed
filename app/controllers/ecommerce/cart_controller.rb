class Ecommerce::CartController < ApplicationController
  before_action :set_cart

  def show
    @items = @cart.items
    @total_price = @cart.total_price

    render Ecommerce::CartComponent.new(
      items: @cart.items,
      total_price: @cart.total_price
    )
  end

  def add
    @cart.add_product(params[:product_id], params[:quantity].to_i > 0 ? params[:quantity].to_i : 1)
    redirect_to ecommerce_cart_path, notice: "Produkt dodany do koszyka."
  end

  def remove
    @cart.remove_product(params[:product_id])
    redirect_to ecommerce_cart_path, notice: "Produkt usunięty z koszyka."
  end

  def clear
    @cart.clear
    redirect_to ecommerce_cart_path, notice: "Koszyk został wyczyszczony."
  end

  private

  def set_cart
    @cart = CartService.new(session)
  end
end
