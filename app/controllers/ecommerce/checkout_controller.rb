# https://docs.stripe.com/checkout/quickstart?lang=ruby
class Ecommerce::CheckoutController < ApplicationController

  def create
    cart = CartService.new(session)

    if cart.empty?
      redirect_to ecommerce_cart_url
      return
    end

    session = Stripe::Checkout::Session.create(
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
      cancel_url: ecommerce_cart_url
    )

    redirect_to session.url, allow_other_host: true

  end

  def success
    render plain: "Success"
  end

  def cancel
    redirect_to ecommerce_cart_path
  end

end
