class Ecommerce::CartController < ApplicationController
  before_action :set_cart, only: %i[show add remove clear]

  def show
    render Ecommerce::CartComponent.new(
      items: @cart.items,
      total_price: @cart.total_price
    )
  end

  def add
    quantity = [params[:quantity].to_i, 1].max
    @cart.add_product(params[:product_id], quantity)
    redirect_to ecommerce_cart_path #, notice: "Produkt dodany do koszyka."
  end

  def remove
    @cart.remove_product(params[:product_id])
    redirect_to ecommerce_cart_path #, notice: "Produkt usunięty z koszyka."
  end

  def clear
    @cart.clear
    redirect_to ecommerce_cart_path #, notice: "Koszyk został wyczyszczony."
  end

  private

  def set_cart
    @cart = CartService.new(session)
  end
end
