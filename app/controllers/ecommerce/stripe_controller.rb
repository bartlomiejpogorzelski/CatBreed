class Ecommerce::StripeController < ApplicationController

  skip_before_action :verify_authenticity_token #csrf


  def webhook
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil
  
    begin
      event = Stripe::Webhook.construct_event(payload, sig_header, ENV['STRIPE_WEBHOOK_SECRET'])
    rescue JSON::ParserError, Stripe::SignatureVerificationError => e
      return head :bad_request
    end
    Rails.logger.info ">>> STRIPE EVENT TYPE: #{event.type}"
    case event.type
    when 'checkout.session.completed'
      session = event.data.object
    
      user = User.find_by(id: session.metadata.user_id)
      cart_items = JSON.parse(session.metadata.cart)
    
      order = Order.create!(
        user: user,
        status: :paid,
        paid_at: Time.current,
        total: 0
      )
    
      cart_items.each do |item|
        product = Product.find(item["product_id"])
    
        order.order_items.create!(
          product: product,
          quantity: item["quantity"],
          unit_price: product.price
        )

        product.decrement!(:stock, item["quantity"])
      end
    end
  
    head :ok
  end
  
end
