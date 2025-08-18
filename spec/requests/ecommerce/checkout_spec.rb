require 'rails_helper'

RSpec.describe "Ecommerce::Checkouts", type: :request do

  before do
    cart = instance_double("CartService")

    allow(CartService).to receive(:new).and_return(cart)
    
    allow(cart).to receive(:empty?).and_return(false)

    allow(cart).to receive(:items).and_return([
      OpenStruct.new(
        product: OpenStruct.new(name: "Testowy Produkt", price: 10.0),
        quantity: 1
      )
    ])

    allow(Stripe::Checkout::Session).to receive(:create).and_return(
      OpenStruct.new(url: "https://checkout.stripe.com/test_session_url")
    )

  end
  describe "POST /Ecommerce/checkouts" do
    it "Create a stripe checkout session and redirects" do
      post ecommerce_checkout_path
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(/stripe\.com/)
    end
  end
end
