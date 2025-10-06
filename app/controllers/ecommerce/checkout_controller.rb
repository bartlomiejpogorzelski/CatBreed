# https://docs.stripe.com/checkout/quickstart?lang=ruby
class Ecommerce::CheckoutController < ApplicationController

  def create
    cart = CartService.new(session)

    if cart.empty?
      redirect_to ecommerce_cart_url
      return
    end

    checkout_session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: cart.items.map do |item|
        {
          price_data: {
            currency: 'pln',
            product_data: {
              name: item.product.name
            },
            unit_amount: (item.product.price * 100).to_i
          },
          quantity: item.quantity
        }
      end,
      mode: 'payment',
      success_url: ecommerce_checkout_success_url,
      cancel_url: ecommerce_cart_url,
      metadata: {
        user_id: current_user&.id,
        cart: cart.items.map { |item| { product_id: item.product.id, quantity: item.quantity } }.to_json
      }
    )

    redirect_to checkout_session.url, allow_other_host: true
  end

  def success
    CartService.new(session).clear
    redirect_to ecommerce_orders_path
  end

  def cancel
    redirect_to ecommerce_cart_path
  end

end
